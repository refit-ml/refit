package edu.cdl.iot.prediction.core.repository

import edu.cdl.iot.common.domain.Sensor

trait PredictionSensorRepository {
  def findAll: List[String]
  def findAll(projectGuid: String): List[String]
  def save(sensors: Seq[Sensor])
}
