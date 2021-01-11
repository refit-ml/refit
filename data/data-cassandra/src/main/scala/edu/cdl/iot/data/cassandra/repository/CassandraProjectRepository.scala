package edu.cdl.iot.data.cassandra.repository

import java.sql.Timestamp
import java.util.UUID

import com.datastax.driver.core.{PreparedStatement, Row}
import edu.cdl.iot.common.domain.Project
import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.common.util.TimestampHelper
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

    val getProjects: String =
      s"""
         |SELECT org_guid, project_guid, name, description, "schema", timestamp, model_guid
         |FROM $keyspace.project
         |""".stripMargin

    val getProject: String =
      s"""
         |SELECT org_guid, project_guid, name, description, "schema", timestamp, model_guid
         |FROM $keyspace.project
         |WHERE org_guid = ?
         |AND project_guid = ?
         |""".stripMargin
  }

  private object Statement {
    lazy val createProject: PreparedStatement = cassandraRepository.prepare(Query.createProject)
    lazy val getProjects: PreparedStatement = cassandraRepository.prepare(Query.getProjects)
    lazy val getProject: PreparedStatement = cassandraRepository.prepare(Query.getProject)
  }

  private def rowToProject(row: Row) =
    Project(
      orgGuid = UUID.fromString(row.get("org_guid", classOf[String])),
      projectGuid = UUID.fromString(row.get("project_guid", classOf[String])),
      modelGuid = UUID.fromString(row.get("model_guid", classOf[String])),
      name = row.getString("name"),
      description = row.getString("description"),
      schema = SchemaFactory.parse(row.getString("schema")),
      timestamp = Timestamp.from(row.getTimestamp("timestamp").toInstant)
    )

  def save(project: Project): Unit =
    cassandraRepository
      .execute(Statement.createProject.bind(
        project.orgGuid.toString,
        project.projectGuid.toString,
        project.name,
        project.schema.toYaml,
        project.timestamp
      ))


  def find: List[Project] =
    cassandraRepository.execute(Statement.getProjects.bind())
      .all()
      .asScala
      .map(rowToProject)
      .toList

  def find(projectGuid: UUID): Project = {
    val row = cassandraRepository
      .execute(Statement.getProjects.bind())
      .all()
      .asScala
      .filter(x => x.getString("project_guid") == projectGuid.toString)
      .head

    rowToProject(row)
  }


}
