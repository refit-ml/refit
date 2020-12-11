package edu.cdl.iot.ingestion.core.repository

import edu.cdl.iot.common.domain.Sensor

trait SensorRepository {
  def createSensor(sensors: Seq[Sensor])
}
