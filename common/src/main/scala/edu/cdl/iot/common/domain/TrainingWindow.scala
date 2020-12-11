package edu.cdl.iot.common.domain

import java.sql.Timestamp

case class TrainingWindow(project_guid: String,
                          sensor_id: String,
                          partition_key: String,
                          start: Timestamp,
                          end: Timestamp)
