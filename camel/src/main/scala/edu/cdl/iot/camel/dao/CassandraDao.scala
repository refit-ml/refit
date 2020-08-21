package edu.cdl.iot.camel.dao

import java.sql.Timestamp
import java.time.Instant

import com.datastax.driver.core.{Cluster, HostDistance, PoolingOptions, PreparedStatement, Session}
import edu.cdl.iot.protocol.Prediction.Prediction
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import collection.JavaConverters.mapAsJavaMapConverter


object CassandraDao {

  val host = "127.0.0.1"
  val keyspace = "cdl_refit"
  val user = "cassandra"
  val password = "cassandra"
  val port = 9042

  lazy val poolingOptions: PoolingOptions = {
    new PoolingOptions()
      .setConnectionsPerHost(HostDistance.LOCAL, 4, 10)
      .setConnectionsPerHost(HostDistance.REMOTE, 2, 4)
  }

  lazy val cluster: Cluster = {
    val builder = Cluster.builder()
    builder.addContactPoint(host)
    builder.withCredentials(user, password)
    builder.withPort(port)
    builder.build()
  }

  val session: Session = cluster.connect()

  object queries {
    val schemaCreateSensorData: String =
      s"""
         |INSERT INTO $keyspace.sensor_data(project_guid, sensor_id, partition_key, timestamp, data, prediction)
         |VALUES(?, ?, ?, ?, ?, ?)
    """.stripMargin

    val schemaCreateSensor: String =
      s"""
         |INSERT INTO $keyspace.sensor(project_guid, sensor_id, created_at)
         |VALUES (?, ?, ?)
         |IF NOT EXISTS
    """.stripMargin

    val getSensors: String =
      s"""
         |SELECT sensor_id
         |FROM $keyspace.sensor
         |WHERE project_guid = ?
         |""".stripMargin
  }

  object statements {
    lazy val sensorDataStatement: PreparedStatement = session.prepare(queries.schemaCreateSensorData)
    lazy val sensorStatement: PreparedStatement = session.prepare(queries.schemaCreateSensor)
  }

  def savePrediction(record: Prediction, data: Map[String, String], predictions: Map[String, String]): Unit = {
    val timestamp = DateTime.parse(record.timestamp, DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss"))

    session.execute(statements.sensorDataStatement
      .bind(
        record.projectGuid,
        record.sensorId,
        record.sensorId,
        Timestamp.from(Instant.ofEpochMilli(timestamp.getMillis)),
        data.asJava,
        predictions.asJava
      ))
    session.execute(statements.sensorStatement
      .bind(
        record.projectGuid,
        record.sensorId,
        Timestamp.from(Instant.ofEpochMilli(timestamp.getMillis))
      ))
  }

}
