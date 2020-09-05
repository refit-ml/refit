package edu.cdl.iot.camel.dao.queries

case class PredictionQueries(private val keyspace: String) {
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
}
