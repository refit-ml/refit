package edu.cdl.iot.integrations.dao.queries

case class GrafanaQueries(private val keyspace: String) {

  val getSensorData: String =
    s"""
       |SELECT * FROM $keyspace.sensor_data
       |WHERE project_guid = ?
       |AND sensor_id = ?
       |AND partition_key = ?
      """.stripMargin

  val getAllSensors: String =
    s"""
       |SELECT sensor_id
       |FROM $keyspace.sensor
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

  val getOrgs: String =
    s"""
       |SELECT org_guid, name
       |FROM $keyspace.org
       |""".stripMargin

  val getProjectSchema: String =
    s"""
       |SELECT "schema"
       |FROM $keyspace.project
       |WHERE org_guid = ?
       |AND project_guid = ?
       |""".stripMargin
}
