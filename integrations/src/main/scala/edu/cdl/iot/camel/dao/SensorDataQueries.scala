package edu.cdl.iot.camel.dao

case class SensorDataQueries(private val keyspace: String) {
  val createSensorData: String =
    s"""
       |UPDATE $keyspace.sensor_data
       |SET data = ?,
       |    prediction = ?,
       |    labels = ?
       |WHERE project_guid = ?
       |AND sensor_id = ?
       |AND partition_key = ?
       |AND timestamp = ?
    """.stripMargin

  val createSensor: String =
    s"""
       |INSERT INTO $keyspace.sensor(project_guid, sensor_id, created_at)
       |VALUES (?, ?, ?)
       |IF NOT EXISTS
    """.stripMargin

  val getSensorData: String =
    s"""
       |SELECT * FROM $keyspace.sensor_data
       |WHERE project_guid = ?
       |AND sensor_id = ?
       |AND partition_key = ?
      """.stripMargin

  val getSensorDataInRange: String =
    s"""
       |SELECT project_guid, sensor_id, partition_key, timestamp, data, prediction
       |FROM $keyspace.sensor_data
       |WHERE project_guid = ?
       |AND sensor_id = ?
       |AND partition_key = ?
       |""".stripMargin

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
       |SELECT project_guid, name, "schema"
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
