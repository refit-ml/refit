package edu.cdl.iot.db.fixtures.dto

case class TrainingWindow(project_guid: String,
                          sensor_id: String,
                          partition_key: String,
                          start: String,
                          end: String)
