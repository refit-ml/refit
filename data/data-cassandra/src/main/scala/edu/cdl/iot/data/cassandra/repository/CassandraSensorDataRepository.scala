package edu.cdl.iot.data.cassandra.repository

import java.sql.Timestamp
import java.text.SimpleDateFormat

import com.datastax.oss.driver.api.core.cql.{BatchStatement, BatchStatementBuilder, BatchType, BoundStatement, PreparedStatement, Row}
import edu.cdl.iot.common.domain.SensorData
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.data.cassandra.CassandraRepository

import scala.collection.JavaConverters.{asScalaBufferConverter, mapAsJavaMapConverter, mapAsScalaMapConverter}


class CassandraSensorDataRepository(cassandraRepository: CassandraRepository,
                                    decryptionHelper: String => EncryptionHelper = null) {
  private val keyspace = cassandraRepository.keyspace

  private object Query {
    val createSensorData: String =
      s"""
         |INSERT INTO $keyspace.sensor_data (project_guid, sensor_id, partition_key, timestamp, data, prediction)
         |VALUES (?, ?, ?, ?, ?, ?)
         |""".stripMargin

    val getSensorData: String =
      s"""
         |SELECT * FROM $keyspace.sensor_data
         |WHERE project_guid = ?
         |AND sensor_id = ?
         |AND partition_key = ?
      """.stripMargin
  }

  private object Statement {
    lazy val createSensorData: PreparedStatement = cassandraRepository.prepare(Query.createSensorData)
    lazy val getSensorData: PreparedStatement = cassandraRepository.prepare(Query.getSensorData)
  }


  private def createSensorData(sensorData: SensorData): BoundStatement =
    Statement.createSensorData.bind(
      sensorData.project_guid,
      sensorData.sensor_id,
      sensorData.partition_key,
      sensorData.timestamp,
      sensorData.data.asJava,
      sensorData.prediction.asJava
    )

  def save(sensorData: Seq[SensorData]): Unit = {
    val batchedStatement = new BatchStatementBuilder(BatchType.LOGGED)
    sensorData.toList.map(createSensorData)
      .foreach(batchedStatement.addStatement)
    cassandraRepository.execute(batchedStatement.build())
  }

  private def find(projectGuid: String,
                   sensorId: String,
                   partition: String): List[Row] =
    cassandraRepository.execute(
      Statement.getSensorData.bind(
        projectGuid,
        sensorId,
        partition))
      .all()
      .asScala
      .toList

  def find(projectGuid: String,
           sensorId: String,
           partitions: List[String]): List[Map[String, String]] = {
    partitions.flatMap(partition => find(projectGuid, sensorId, partition))
      .map(row => {
        val helper = decryptionHelper(projectGuid)
        val formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        val timestamp = formatter.format(row.get("timestamp", classOf[Timestamp]))
        val data = helper.transform(row.getMap("data", classOf[String], classOf[String]).asScala.toMap)
        val predictions = helper.transform(row.getMap("prediction", classOf[String], classOf[String]).asScala.toMap)
          .map(x => s"prediction - ${x._1}" -> x._2)
        val labels = helper.transform(row.getMap("labels", classOf[String], classOf[String]).asScala.toMap)
          .map(x => s"actual - ${x._1}" -> x._2)

        Map(
          "sensorid" -> sensorId,
          "timestamp" -> timestamp
        ) ++ predictions ++ labels ++ data
      })
  }

}
