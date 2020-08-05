package edu.cdl.iot.db.fixtures.dto


case class SensorData(project_guid: String,
                      sensor_id: String,
                      partition_key: String,
                      timestamp: String,
                      data: Map[String, String],
                      prediction: Map[String, String])