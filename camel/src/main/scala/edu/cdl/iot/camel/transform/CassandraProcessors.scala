package edu.cdl.iot.camel.transform

import java.sql.Timestamp
import java.time.Instant

import edu.cdl.iot.camel.dao.CassandraDao
import edu.cdl.iot.camel.dto.{QueryRequest, QueryTarget}
import edu.cdl.iot.common.schema.{Schema, SchemaFactory}
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.{Exchange, Processor}
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.PredictionHelper
import javax.crypto.Cipher

import collection.JavaConverters._
import scala.collection.mutable

object CassandraProcessors {
  val ENCRYPTION_KEY = "keyboard_cat"
  val decryptionHelpers: mutable.HashMap[String, EncryptionHelper] = new mutable.HashMap[String, EncryptionHelper]()


  val sendToCassandra: Processor = new Processor {
    val encryptionHelpers: mutable.HashMap[String, EncryptionHelper] = new mutable.HashMap[String, EncryptionHelper]()

    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn().getBody(classOf[Prediction])
      val helper = encryptionHelpers.getOrElseUpdate(record.projectGuid, {
        // This is slow, so we delay evaluation and only compute once when we need it
        new EncryptionHelper(ENCRYPTION_KEY, record.projectGuid)
      })

      val data = helper.transform(PredictionHelper.combineSensorReadings(record))
      val predictions = helper.transform(record.prediction)
      CassandraDao.savePrediction(record, data, predictions)
    }
  }
  val schema: Schema = SchemaFactory.getSchema("dummy")

  val mapToSensorIds: Array[QueryTarget] => Array[(String, String, List[String])] =
    (targets: Array[QueryTarget]) => targets
      .map(x => (x.`type`, x.target, CassandraDao.getSensors(schema.projectGuid.toString)))
      .map(tuple =>
        tuple.copy(_3 = tuple._3.all().asScala.map(x =>
          x.get("sensor_id", classOf[String])).toList))

  private val getSensorReadings = (projectGuid: String,
                                   sensorId: String) => {
    CassandraDao.getSensorData(projectGuid, sensorId)
      .all()
      .asScala
      .map(row => {
        val helper = decryptionHelpers.getOrElseUpdate(projectGuid, {
          // This is slow, so we delay evaluation and only compute once when we need it
          new EncryptionHelper(ENCRYPTION_KEY, projectGuid, Cipher.DECRYPT_MODE)
        })

        val timestamp = Timestamp.from(row.getTimestamp("timestamp").toInstant)
        val data = row.getMap("data", classOf[String], classOf[String]).asScala.toMap
        val predictions = row.getMap("prediction", classOf[String], classOf[String]).asScala.toMap

        Map(
          "sensorid" -> sensorId,
          "timestamp" -> timestamp.toString
        ) ++ helper.transform(data) ++ helper.transform(predictions)
      })
  }

  val grafanaQuery: Processor = new Processor {

    override def process(exchange: Exchange): Unit = {
      val projectGuid = schema.projectGuid.toString
      val record = exchange.getIn.getBody(classOf[QueryRequest])
      val sensors = mapToSensorIds(record.targets)
        .map(tuple => tuple.copy(
          _3 = tuple._3.flatMap(sensorId => getSensorReadings(projectGuid, sensorId))
        ))

     exchange.getIn.setBody(sensors)
    }
  }


  val recFromCassandra: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      println("Executing the statement")
      val results = CassandraDao.getSensorData
      println("Executed the statement")
      println(results)
    }
  }
}
