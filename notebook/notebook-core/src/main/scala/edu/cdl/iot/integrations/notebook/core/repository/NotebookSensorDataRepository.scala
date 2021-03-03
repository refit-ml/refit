package edu.cdl.iot.integrations.notebook.core.repository

import edu.cdl.iot.protocol.SensorData.SensorData

trait NotebookSensorDataRepository {
  def createSensorData(sensorData: SensorData)
}
