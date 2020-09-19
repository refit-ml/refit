package edu.cdl.iot.ingestion.dao

import com.datastax.driver.core.{BatchStatement, BoundStatement, PreparedStatement, ResultSet}
import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.yaml.CassandraConfig
import edu.cdl.iot.dao.RefitDao
import edu.cdl.iot.ingestion.dao.queries.ImportQueries
import edu.cdl.iot.ingestion.dto.{Org, Project, Sensor, SensorData, TrainingWindow}

import collection.JavaConverters.mapAsJavaMapConverter
import collection.JavaConverters._


class ImportDao(private val config: CassandraConfig) extends RefitDao(config) {

  private val queries = ImportQueries(config.keyspace)

  object statements {
    lazy val createOrg: PreparedStatement = session.prepare(queries.createOrg)
    lazy val createProject: PreparedStatement = session.prepare(queries.createProject)
    lazy val createSensorData: PreparedStatement = session.prepare(queries.createSensorData)
    lazy val createTrainingWindow: PreparedStatement = session.prepare(queries.createTrainingWindow)
    lazy val createSensor: PreparedStatement = session.prepare(queries.createSensor)
    lazy val getProjectSchema: PreparedStatement = session.prepare(queries.getProjectSchema)
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

  def createSensorData(records: Seq[SensorData]): ResultSet = {
    val batchedStatement = new BatchStatement()
    records.toList.map(createSensorData)
      .foreach(batchedStatement.add)
    session.execute(batchedStatement)
  }

  def createSensor(record: Sensor): BoundStatement =
    statements.createSensor.bind(
      record.projectGuid,
      record.sensorId,
      record.createdAt
    )

  def createSensor(records: Seq[Sensor]): ResultSet = {
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

  def getSchema(projectGuid: String): Schema =
    session.execute(statements.getProjectSchema.bind())
      .all
      .asScala
      .filter(x => x.getString("project_guid") == projectGuid)
      .map(x => SchemaFactory.parse(x.get("schema", classOf[String])))
      .toList
      .head
}