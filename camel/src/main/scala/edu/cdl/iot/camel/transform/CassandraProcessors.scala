package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dao.CassandraDao
import edu.cdl.iot.camel.dto.request.{QueryFilters, QueryRequest, QueryTarget}
import edu.cdl.iot.camel.dto.{GrafanaSensorDataDto, GrafanaSensorsDto}
import edu.cdl.iot.common.schema.{Schema, SchemaFactory}
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.{Exchange, Processor}
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.PredictionHelper
import javax.crypto.Cipher
import org.joda.time.DateTime

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

  val sensorFilterPredicate: QueryFilters => Boolean =
    (x: QueryFilters) => x.key == "sensor" && x.operator == "="

  val getSensorIds: (String, Array[QueryFilters]) => List[String] =
    (projectGuid: String, filters: Array[QueryFilters]) =>
      if (filters.exists(sensorFilterPredicate))
        filters.filter(sensorFilterPredicate)
          .map(filter => filter.value).toList
      else
        CassandraDao.getSensors(projectGuid)

  val mapToSensorIds: QueryRequest => List[GrafanaSensorsDto] =
    (request: QueryRequest) => request.targets
      .map(x =>
        GrafanaSensorsDto(
          schema.projectGuid.toString,
          x.`type`,
          x.target,
          getSensorIds(schema.projectGuid.toString, request.adhocFilters)))
      .toList

  val getEncryptionHelper: String => EncryptionHelper = (projectGuid) =>
    decryptionHelpers.getOrElseUpdate(projectGuid, {
      new EncryptionHelper(ENCRYPTION_KEY, projectGuid, Cipher.DECRYPT_MODE)
    })

  val getSensorReadings: (GrafanaSensorsDto, String) => GrafanaSensorDataDto =
    (sensors: GrafanaSensorsDto, sensorId: String) => {
      val data = CassandraDao.getSensorData(getEncryptionHelper,
        sensors.projectGuid,
        sensorId)

      GrafanaSensorDataDto(
        sensors.projectGuid,
        sensors.`type`,
        sensors.target,
        sensorId,
        data
      )
    }


  val grafanaQuery: Processor = new Processor {

    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn.getBody(classOf[QueryRequest])
      val data = mapToSensorIds(record)
        .flatMap(x => x.sensors.map(y => getSensorReadings(x, y)))

      exchange.getIn.setBody(data)
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
