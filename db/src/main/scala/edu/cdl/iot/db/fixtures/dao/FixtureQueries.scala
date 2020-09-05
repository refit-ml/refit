package edu.cdl.iot.db.fixtures.dao

case class FixtureQueries(keyspace: String) {
  val createOrg: String =
    s"""
       |INSERT INTO $keyspace.org (org_guid, name, timestamp)
       |VALUES (?, ?, ?)
       |""".stripMargin

  val createProject: String =
    s"""
       |INSERT INTO $keyspace.project (org_guid, project_guid, name, "schema", timestamp)
       |VALUES (?, ?, ?, ?, ?)
       |""".stripMargin

  val createSensorData: String =
    s"""
       |INSERT INTO $keyspace.sensor_data (project_guid, sensor_id, partition_key, timestamp, data, prediction)
       |VALUES (?, ?, ?, ?, ?, ?)
       |""".stripMargin

  val createTrainingWindow: String =
    s"""
       |INSERT INTO $keyspace.training_window (project_guid, sensor_id, partition_key, start, end)
       |VALUES (?, ?, ?, ?, ?)
       |""".stripMargin

  val createSensor: String =
    s"""
       |INSERT INTO $keyspace.sensor (project_guid, sensor_id, created_at)
       |VALUES (?, ?, ?)
       |""".stripMargin
}
