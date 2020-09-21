package edu.cdl.iot.db.fixtures.dao

import com.datastax.driver.core.{PreparedStatement, ResultSet}
import edu.cdl.iot.common.yaml.CassandraConfig
import edu.cdl.iot.dao.RefitDao
import edu.cdl.iot.db.fixtures.dto.{Org, Project}


class FixtureDao(private val config: CassandraConfig) extends RefitDao(config) {

  private val queries = FixtureQueries(config.keyspace)

  object statements {
    lazy val createOrg: PreparedStatement = session.prepare(queries.createOrg)
    lazy val createProject: PreparedStatement = session.prepare(queries.createProject)
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
}
