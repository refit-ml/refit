package edu.cdl.iot.camel.transform

import java.sql.Timestamp
import java.time.Instant

import com.datastax.driver.core.{Cluster, HostDistance, PoolingOptions, PreparedStatement, Session}
import edu.cdl.iot.camel.transform.CassandraProcessors.session
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.{Exchange, Processor}
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat

import scala.collection.JavaConverters.mapAsScalaMapConverter
import collection.JavaConverters.mapAsJavaMapConverter
import edu.cdl.iot.common.security.EncryptionHelper

import scala.collection.mutable

object CassandraProcessors {
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

  val schemaCreateSensorData =
    s"""
       |INSERT INTO $keyspace.sensor_data(project_guid, sensor_id, partition_key, timestamp, data, prediction)
       |VALUES(?, ?, ?, ?, ?, ?)
    """.stripMargin

  val schemaCreateSensor =
    s"""
       |INSERT INTO $keyspace.sensor(project_guid, sensor_id, created_at)
       |VALUES (?, ?, ?)
       |IF NOT EXISTS
    """.stripMargin

  lazy val sensorDataStatement: PreparedStatement = session.prepare(schemaCreateSensorData)
  lazy val sensorStatement: PreparedStatement = session.prepare(schemaCreateSensor)


  def combineSensorReadings(v: Prediction): Map[String, String] = {
    val data: Map[String, String] = v.integers.map({
      case (x, d) =>
        x -> d.toString
    })
      .++(v.doubles.map({
        case (x, d) =>
          x -> d.toString
      }))
      .++(v.strings.map({
        case (x, d) =>
          x -> d
      }))
    data
  }

  val sendToCassandra: Processor = new Processor {
    val ENCRYPTION_KEY = "keyboard_cat"
    val encryptionHelpers: mutable.HashMap[String, EncryptionHelper] = new mutable.HashMap[String, EncryptionHelper]()

    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn().getBody(classOf[Prediction])
      val timestamp = DateTime.parse(record.timestamp, DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss"))
      val helper = encryptionHelpers.getOrElseUpdate(record.projectGuid, {
        // This is slow, so we delay evaluation and only compute once when we need it
        new EncryptionHelper(ENCRYPTION_KEY, record.projectGuid)
      })

      println("Save Sensor Data")
      session.execute(sensorDataStatement
        .bind(
          record.projectGuid,
          record.sensorId,
          record.sensorId,
          Timestamp.from(Instant.ofEpochMilli(timestamp.getMillis)),
          helper.transform(combineSensorReadings(record)).asJava,
          helper.transform(record.prediction).asJava
        ))
      println("Save Sensor")
      session.execute(sensorStatement
        .bind(
          record.projectGuid,
          record.sensorId,
          Timestamp.from(Instant.ofEpochMilli(timestamp.getMillis))
        ))
      println("Done")
    }
  }
}
