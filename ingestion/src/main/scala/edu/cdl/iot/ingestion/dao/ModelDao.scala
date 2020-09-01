package edu.cdl.iot.ingestion.dao

import com.datastax.driver.core._
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.schema.factories.SchemaFactory
import edu.cdl.iot.common.util.ConfigHelper

import scala.collection.JavaConverters._

object ModelDao {
  val host: String = ConfigHelper.env("CASSANDRA_HOST", "127.0.0.1")
  val keyspace = "cdl_refit"
  val user: String = ConfigHelper.env("CASSANDRA_USER", "cassandra")
  val password: String = ConfigHelper.env("CASSANDRA_PASSWORD", "cassandra")
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