package edu.cdl.iot.db.fixtures.dao

import java.sql.Timestamp

import com.datastax.driver.core.{BatchStatement, BoundStatement, Cluster, HostDistance, PoolingOptions, PreparedStatement, ResultSet, Session}
import edu.cdl.iot.db.fixtures.dto.{Org, Project, Sensor, SensorData, TrainingWindow}

import collection.JavaConverters.mapAsJavaMapConverter
import collection.JavaConverters._

object FixtureDao {
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

  var session: Session = cluster.connect()

  object queries {
    val createOrg: String =
      s"""
         |INSERT INTO $keyspace.org (org_guid, name, timestamp)
         |VALUES (?, ?, ?)
         |""".stripMargin

    val createProject: String =
      s"""
         |INSERT INTO $keyspace.project (org_guid, project_guid, name, "schema", timestamp)
         |VALUES (?, ?, ?, ?, ?)
         |""".stripMargin

    val createSensorData: String =
      s"""
         |INSERT INTO $keyspace.sensor_data (project_guid, sensor_id, partition_key, timestamp, data, prediction)
         |VALUES (?, ?, ?, ?, ?, ?)
         |""".stripMargin

    val createTrainingWindow: String =
      s"""
         |INSERT INTO $keyspace.training_window (project_guid, sensor_id, partition_key, start, end)
         |VALUES (?, ?, ?, ?, ?)
         |""".stripMargin

    val createSensor: String =
      s"""
         |INSERT INTO $keyspace.sensor (project_guid, sensor_id, created_at)
         |VALUES (?, ?, ?)
         |""".stripMargin
  }

  object statements {
    lazy val createOrg: PreparedStatement = session.prepare(queries.createOrg)
    lazy val createProject: PreparedStatement = session.prepare(queries.createProject)
    lazy val createSensorData: PreparedStatement = session.prepare(queries.createSensorData)
    lazy val createTrainingWindow: PreparedStatement = session.prepare(queries.createTrainingWindow)
    lazy val createSensor: PreparedStatement = session.prepare(queries.createSensor)
  }

  def createOrg(record: Org): ResultSet =
    session.execute(statements.createOrg.bind(
      record.orgGuid.toString,
      record.name,
      record.timestamp
    ))

  def createProject(record: Project): ResultSet =
    session.execute(statements.createProject.bind(
      record.orgGuid.toString,
      record.projectGuid.toString,
      record.name,
      record.schema.toYaml,
      record.timestamp
    ))

  def createSensorData(record: SensorData): BoundStatement =
    statements.createSensorData.bind(
      record.project_guid,
      record.sensor_id,
      record.partition_key,
      record.timestamp,
      record.data.asJava,
      record.prediction.asJava
    )

  def createSensorData(records: List[SensorData]): ResultSet = {
    val batchedStatement = new BatchStatement()
    records.map(createSensorData)
      .foreach(batchedStatement.add)
    session.execute(batchedStatement)
  }

  def createSensor(record: Sensor): BoundStatement =
    statements.createSensor.bind(
      record.projectGuid,
      record.sensorId,
      record.createdAt
    )

  def createSensor(records: List[Sensor]): ResultSet = {
    val batchStatement = new BatchStatement()
    records.map(createSensor)
      .foreach(batchStatement.add)
    session.execute(batchStatement)
  }

  def createTrainingWindow(record: TrainingWindow): BoundStatement =
    statements.createTrainingWindow.bind(
      record.project_guid,
      record.sensor_id,
      record.partition_key,
      record.start,
      record.end
    )

  def createTrainingWindow(records: List[TrainingWindow]): ResultSet = {
    val batchedStatement = new BatchStatement()
    records.map(createTrainingWindow)
      .foreach(batchedStatement.add)
    session.execute(batchedStatement)
  }

  def open(): Unit = session = cluster.connect()

  def close(): Unit = {
    session.close()
    session = null
  }
}
