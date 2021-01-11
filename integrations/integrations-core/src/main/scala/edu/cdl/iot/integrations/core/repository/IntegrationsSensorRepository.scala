package edu.cdl.iot.integrations.core.repository

import edu.cdl.iot.common.domain.Sensor

trait IntegrationsSensorRepository {
  def getAllSensors: List[String]
  def getSensors(projectGuid: String): List[String]
  def createSensors(sensors: Seq[Sensor])
}
