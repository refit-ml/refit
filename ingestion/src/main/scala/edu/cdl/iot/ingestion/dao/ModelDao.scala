package edu.cdl.iot.ingestion.dao

import com.datastax.driver.core._
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.common.yaml.CassandraConfig
import edu.cdl.iot.dao.RefitDao

import scala.collection.JavaConverters._

class ModelDao(private val config: CassandraConfig) extends RefitDao(config) {
  private val keyspace = config.keyspace

  object queries {
    val getModel: String =
      s"""
         |SELECT model
         |FROM $keyspace.models
         |WHERE project_guid = ?
         |AND model_guid = ?
         |""".stripMargin

    val getProject: String =
      s"""
         |SELECT project_guid, model_guid, "schema"
         |FROM $keyspace.project
         |""".stripMargin
  }

  object statements {
    lazy val getModel: PreparedStatement = session.prepare(queries.getModel)
    lazy val getProject: PreparedStatement = session.prepare(queries.getProject)
  }

  def getModel(projectGuid: String, modelGuid: String): Array[Byte] =
    session.execute(statements.getModel.bind(projectGuid, modelGuid))
      .all
      .asScala
      .head
      .getBytes("model").array()

  def getModelGuid(projectGuid: String): String =
    session.execute(statements.getProject.bind())
      .all()
      .asScala
      .filter(x => x.getString("project_guid") == projectGuid)
      .map(x => x.getString("model_guid"))
      .head

  def getProjects: List[String] =
    session.execute(statements.getProject.bind())
      .all()
      .asScala
      .filter(x => x.getString("model_guid") != null)
      .map(x => x.getString("project_guid"))
      .toList

  def getProjectSchema(projectGuid: String): Schema =
    session.execute(statements.getProject.bind())
      .all
      .asScala
      .filter(project => project.getString("project_guid") == projectGuid)
      .map(project => SchemaFactory.parse(project.getString("schema")))
      .head


}