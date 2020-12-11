package edu.cdl.iot.ingestion.core.repository

import edu.cdl.iot.protocol.SensorData.SensorData


trait SensorDataRepository {
  def createSensorData(sensorData: Seq[SensorData])

  def createSensorData(sensorData: SensorData)
}
