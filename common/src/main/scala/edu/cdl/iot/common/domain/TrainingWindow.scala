package edu.cdl.iot.common.domain

import java.sql.Timestamp

case class TrainingWindow(project_guid: String,
                          sensor_id: String,
                          partition_key: String,
                          start: Timestamp,
                          end: Timestamp) {
  def getProjectGuid: String = project_guid

  def getSensorId: String = sensor_id

  def getPartitionKey: String = partition_key

  def getStart: Timestamp = start

  def getEnd: Timestamp = end
}
