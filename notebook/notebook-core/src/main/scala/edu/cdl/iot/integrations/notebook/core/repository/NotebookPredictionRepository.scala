package edu.cdl.iot.integrations.notebook.core.repository

import edu.cdl.iot.protocol.SensorData.SensorData

trait NotebookPredictionRepository {
  def find(projectGuid: String,
           sensorId: String,
           partitions: List[String]): List[Map[String, String]]


}
