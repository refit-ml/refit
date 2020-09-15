package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dao.CassandraDao
import edu.cdl.iot.camel.dto.request.{QueryFilters, QueryRequest}
import edu.cdl.iot.camel.dto.{GrafanaSensorDataDto, GrafanaSensorsDto}
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.{Exchange, Processor}
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.{ConfigHelper, PredictionHelper}
import javax.crypto.Cipher

import scala.collection.mutable

object CassandraProcessors {
  val ENCRYPTION_KEY: String = ConfigHelper.env("ENCRYPTION_KEY", "keyboard_cat")
  val SCHEMA_HEADER = "REFIT_SCHEMA"
  val ORG_HEADER = "REFIT_ORG"
  val QUERY_PARTITIONS_HEADER = "REFIT_QUERY_PARTITIONS"
  val decryptionHelpers: mutable.HashMap[String, EncryptionHelper] = new mutable.HashMap[String, EncryptionHelper]()

  private val sensorFilterPredicate: QueryFilters => Boolean =
    (x: QueryFilters) => x.key == "sensor" && x.operator == "="

  private val getSensorIds: (String, Array[QueryFilters]) => List[String] =
    (projectGuid: String, filters: Array[QueryFilters]) =>
      if (filters.exists(sensorFilterPredicate))
        filters.filter(sensorFilterPredicate)
          .map(filter => filter.value).toList
      else
        CassandraDao.getSensors(projectGuid)

  private val mapToSensorIds: (Schema, QueryRequest) => GrafanaSensorsDto =
    (schema: Schema, request: QueryRequest) =>
        GrafanaSensorsDto(
          schema.projectGuid.toString,
          request.targets.head.`type`,
          request.targets.map(x => x.target).toList,
          getSensorIds(schema.projectGuid.toString, request.adhocFilters))

  private val getEncryptionHelper: String => EncryptionHelper = projectGuid =>
    decryptionHelpers.getOrElseUpdate(projectGuid, {
      new EncryptionHelper(ENCRYPTION_KEY, projectGuid, Cipher.DECRYPT_MODE)
    })

  private val getSensorReadings: (GrafanaSensorsDto, String, List[String]) => GrafanaSensorDataDto =
    (sensors: GrafanaSensorsDto, sensorId: String, partitions: List[String]) => {
      val result = CassandraDao.getSensorData(getEncryptionHelper,
        sensors.projectGuid,
        sensorId,
        partitions)

      val data = result.filter( x => sensors.targets.exists(y => x.contains(y.toLowerCase))) //filter to check if anything in the target check in list of strings

      GrafanaSensorDataDto(
        sensors.projectGuid,
        sensors.`type`,
        sensors.targets,
        sensorId,
        data
      )
    }

  val sendToCassandra: Processor = new Processor {
    val encryptionHelpers: mutable.HashMap[String, EncryptionHelper] = new mutable.HashMap[String, EncryptionHelper]()

    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn().getBody(classOf[Prediction])
      val schema = exchange.getIn.getHeader(SCHEMA_HEADER).asInstanceOf[Schema]
      val helper = encryptionHelpers.getOrElseUpdate(record.projectGuid, {
        // This is slow, so we delay evaluation and only compute once when we need it
        new EncryptionHelper(ENCRYPTION_KEY, record.projectGuid)
      })

      val data = helper.transform(PredictionHelper.combineSensorReadings(record))
      val predictions = helper.transform(record.prediction)
      CassandraDao.savePrediction(schema, record, data, predictions)
    }
  }

  val grafanaQuery: Processor = new Processor {

    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn.getBody(classOf[QueryRequest])
      val schema = exchange.getIn.getHeader(SCHEMA_HEADER, classOf[Schema])
      val partitions = exchange.getIn.getHeader(QUERY_PARTITIONS_HEADER, classOf[List[String]])

      val sensors = mapToSensorIds(schema, record)

      val data = sensors.sensors.map(x => getSensorReadings(sensors, x, partitions))

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
