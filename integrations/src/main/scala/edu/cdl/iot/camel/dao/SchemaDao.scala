package edu.cdl.iot.camel.dao

import com.datastax.driver.core.PreparedStatement
import edu.cdl.iot.camel.dao.queries.SchemaQueries
import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.yaml.CassandraConfig
import edu.cdl.iot.dao.RefitDao

import collection.JavaConverters._

class SchemaDao(private val config: CassandraConfig) extends RefitDao(config) {

  private val queries = SchemaQueries(config.keyspace)

  object statements {
    lazy val getProjects: PreparedStatement = session.prepare(queries.getProjects)
    lazy val getProjectSchema: PreparedStatement = session.prepare(queries.getProjectSchema)
  }


  def getProjectSchema(orgGuid: String, projectGuid: String): Schema =
    session.execute(statements.getProjectSchema.bind(orgGuid, projectGuid))
      .all
      .asScala
      .map(x => SchemaFactory.parse(x.get("schema", classOf[String])))
      .toList
      .head

  def getProjectSchemas: List[Schema] =
    session.execute(statements.getProjects.bind)
      .all
      .asScala
      .map(x => SchemaFactory.parse(x.get("schema", classOf[String])))
      .toList

}