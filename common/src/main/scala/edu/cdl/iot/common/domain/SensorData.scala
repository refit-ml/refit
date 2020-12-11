package edu.cdl.iot.common.domain

import java.sql.Timestamp

case class SensorData(project_guid: String,
                      sensor_id: String,
                      partition_key: String,
                      timestamp: Timestamp,
                      data: Map[String, String],
                      prediction: Map[String, String])
