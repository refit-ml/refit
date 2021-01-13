package edu.cdl.iot.integrations.notebook.core.repository

trait NotebookSensorDataRepository {
  def find(projectGuid: String,
                    sensorId: String,
                    partitions: List[String]): List[Map[String, String]]
}
