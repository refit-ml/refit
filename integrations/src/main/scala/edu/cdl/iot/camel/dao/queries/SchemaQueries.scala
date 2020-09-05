package edu.cdl.iot.camel.dao.queries

case class SchemaQueries(private val keyspace: String) {
  val getProjects: String =
    s"""
       |SELECT project_guid, name, "schema"
       |FROM $keyspace.project
       |""".stripMargin

  val getProjectSchema: String =
    s"""
       |SELECT "schema"
       |FROM $keyspace.project
       |WHERE org_guid = ?
       |AND project_guid = ?
       |""".stripMargin
}
