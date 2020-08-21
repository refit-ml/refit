package edu.cdl.iot.camel.transform

import java.sql.Timestamp
import java.time.Instant

import com.datastax.driver.core.{Cluster, HostDistance, PoolingOptions, Session}
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

  lazy implicit val session: Session = cluster.connect()

  lazy val schemaCreateSensorData =
    s"""
       |INSERT INTO $keyspace.sensor_data(project_guid, sensor_id, partition_key, timestamp, data, prediction)
       |VALUES(?, ?, ?, ?, ?, ?)
    """.stripMargin

  lazy val createSensorDataStatement = session.prepare(schemaCreateSensorData)

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
      val statement = createSensorDataStatement.bind(
        record.projectGuid,
        record.sensorId,
        record.sensorId,
        Timestamp.from(Instant.ofEpochMilli(timestamp.getMillis)),
        helper.transform(combineSensorReadings(record)).asJava,
        helper.transform(record.prediction).asJava
      )
      println("Executing the statement")
      session.execute(statement)
      println("Executed the statement")

    }
  }
}
