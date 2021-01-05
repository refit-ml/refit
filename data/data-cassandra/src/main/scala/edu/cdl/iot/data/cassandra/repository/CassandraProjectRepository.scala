package edu.cdl.iot.data.cassandra.repository

import com.datastax.driver.core.PreparedStatement
import edu.cdl.iot.common.domain.Project
import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.data.cassandra.CassandraRepository

import collection.JavaConverters._

class CassandraProjectRepository(cassandraRepository: CassandraRepository) {
  private val keyspace = cassandraRepository.keyspace

  private object Query {
    val createProject: String =
      s"""
         |INSERT INTO $keyspace.project (org_guid, project_guid, name, "schema", timestamp)
         |VALUES (?, ?, ?, ?, ?)
         |""".stripMargin

    val getSchema: String =
      s"""
         |SELECT project_guid, "schema"
         |FROM $keyspace.project
         |""".stripMargin

    val getProjects: String =
      s"""
         |SELECT project_guid, name
         |FROM $keyspace.project
         |""".stripMargin
  }

  private object Statement {
    lazy val createProject: PreparedStatement = cassandraRepository.prepare(Query.createProject)
    lazy val getSchema: PreparedStatement = cassandraRepository.prepare(Query.getSchema)
    lazy val getProjects: PreparedStatement = cassandraRepository.prepare(Query.getProjects)
  }

  def getSchema(projectGuid: String): Schema =
    cassandraRepository
      .execute(Statement.getSchema.bind())
      .all
      .asScala
      .filter(x => x.getString("project_guid") == projectGuid)
      .map(x => SchemaFactory.parse(x.get("schema", classOf[String])))
      .toList
      .head

  def getSchemas: List[Schema] =
    cassandraRepository
      .execute(Statement.getSchema.bind())
      .all
      .asScala
      .map(x => SchemaFactory.parse(x.get("schema", classOf[String])))
      .toList

  def createProject(project: Project): Unit =
    cassandraRepository
      .execute(Statement.createProject.bind(
        project.orgGuid.toString,
        project.projectGuid.toString,
        project.name,
        project.schema.toYaml,
        project.timestamp
      ))

  def getProjects: List[String] =
    cassandraRepository.execute(Statement.getProjects.bind())
      .all()
      .asScala
      .map(x => s"${x.get("name", classOf[String])} - ${x.get("project_guid", classOf[String])}")
      .toList
}
