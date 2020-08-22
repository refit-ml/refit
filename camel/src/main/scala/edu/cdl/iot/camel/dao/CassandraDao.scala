package edu.cdl.iot.camel.dao

import java.sql.Timestamp
import java.time.Instant

import com.datastax.driver.core.{Cluster, HostDistance, PoolingOptions, PreparedStatement, ResultSet, Session}
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.protocol.Prediction.Prediction
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat

import collection.JavaConverters.mapAsJavaMapConverter
import collection.JavaConverters._


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
    val createSensorData: String =
      s"""
         |INSERT INTO $keyspace.sensor_data(project_guid, sensor_id, partition_key, timestamp, data, prediction)
         |VALUES(?, ?, ?, ?, ?, ?)
    """.stripMargin

    val createSensor: String =
      s"""
         |INSERT INTO $keyspace.sensor(project_guid, sensor_id, created_at)
         |VALUES (?, ?, ?)
         |IF NOT EXISTS
    """.stripMargin

    val getSensorData: String =
      s"""
         |SELECT * FROM $keyspace.sensor_data
      """.stripMargin

    val getSensorDataInRange: String =
      s"""
         |SELECT project_guid, sensor_id, partition_key, timestamp, data, prediction
         |FROM $keyspace.sensor_data
         |WHERE project_guid = ?
         |AND sensor_id = ?
         |AND partition_key = ?
         |""".stripMargin

    val getSensors: String =
      s"""
         |SELECT sensor_id
         |FROM $keyspace.sensor
         |WHERE project_guid = ?
         |""".stripMargin

    val getProjects: String =
      s"""
         |SELECT project_guid, name
         |FROM $keyspace.project
         |""".stripMargin
  }

  object statements {
    lazy val createSensorData: PreparedStatement = session.prepare(queries.createSensorData)
    lazy val createSensor: PreparedStatement = session.prepare(queries.createSensor)
    lazy val getSensors: PreparedStatement = session.prepare(queries.getSensors)
    lazy val getSensorData: PreparedStatement = session.prepare(queries.getSensorData)
    lazy val getSensorDataInRange: PreparedStatement = session.prepare(queries.getSensorDataInRange)
    lazy val getProjects: PreparedStatement = session.prepare(queries.getProjects)
  }


  def savePrediction(record: Prediction, data: Map[String, String], predictions: Map[String, String]): Unit = {
    val timestamp = TimestampHelper.parse(record.timestamp)

    session.execute(statements.createSensorData
      .bind(
        record.projectGuid,
        record.sensorId,
        record.sensorId,
        timestamp,
        data.asJava,
        predictions.asJava
      ))
    session.execute(statements.createSensor
      .bind(
        record.projectGuid,
        record.sensorId,
        timestamp
      ))
  }

  def getSensorData: ResultSet = session.execute(statements.getSensorData.bind())

  def getProjects: List[String] =
    session.execute(statements.getProjects.bind())
      .all()
      .asScala
      .map(x => s"${x.get("name", classOf[String])} - ${x.get("project_guid", classOf[String])}" )
      .toList

  def getSensors(projectGuid: String): List[String] =
    session.execute(statements.getSensors.bind(projectGuid))
      .all()
      .asScala
      .map(x => x.get("sensor_id", classOf[String]))
      .toList

  def getSensorData(decryptionHelper: String => EncryptionHelper,
                    projectGuid: String,
                    sensorId: String): List[Map[String, String]] =
    session.execute(statements.getSensorDataInRange.bind(projectGuid, sensorId, sensorId))
      .all()
      .asScala
      .map(row => {
        val helper = decryptionHelper(projectGuid)
        val timestamp = Timestamp.from(row.getTimestamp("timestamp").toInstant)
        val data = row.getMap("data", classOf[String], classOf[String]).asScala.toMap
        val predictions = row.getMap("prediction", classOf[String], classOf[String]).asScala.toMap

        Map(
          "sensorid" -> sensorId,
          "timestamp" -> timestamp.toString
        ) ++ helper.transform(data) ++ helper.transform(predictions)
      }).toList

}
