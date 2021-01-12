package edu.cdl.iot.integrations.grafana.core.repository

import edu.cdl.iot.common.domain.Sensor

trait GrafanaSensorRepository {
  def getAllSensors: List[String]
  def getSensors(projectGuid: String): List[String]
  def createSensors(sensors: Seq[Sensor])
}
