package edu.cdl.iot.data.cassandra.repository

import java.sql.Timestamp

import com.datastax.driver.core.PreparedStatement
import edu.cdl.iot.data.cassandra.CassandraRepository

import scala.collection.JavaConverters.asJavaIterableConverter

class CassandraPredictionRepository(cassandraRepository: CassandraRepository) {
  private val keyspace = cassandraRepository.keyspace

  private object Query {
    val createSensorData: String =
      s"""
         |UPDATE $keyspace.sensor_data
         |SET data = ?,
         |    prediction = ?,
         |    labels = ?
         |WHERE project_guid = ?
         |AND sensor_id = ?
         |AND partition_key = ?
         |AND timestamp = ?
    """.stripMargin
  }

  private object Statement {
    lazy val createSensorData: PreparedStatement = cassandraRepository.prepare(Query.createSensorData)
  }


  def savePrediction(partition: String,
                     timestamp: Timestamp,
                     projectGuid: String,
                     sensorId: String,
                     data: Map[String, String],
                     predictions: Map[String, String],
                     labels: Map[String, String]): Unit =
    cassandraRepository.execute(Statement.createSensorData
      .bind(
        data.asJava,
        predictions.asJava,
        labels.asJava,
        projectGuid,
        sensorId,
        partition,
        timestamp
      ))

}