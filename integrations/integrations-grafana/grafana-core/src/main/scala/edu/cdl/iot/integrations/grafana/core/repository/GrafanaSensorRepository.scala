package edu.cdl.iot.integrations.grafana.core.repository

import edu.cdl.iot.common.domain.Sensor

trait GrafanaSensorRepository {
  def findAll: List[String]
  def findAll(projectGuid: String): List[String]
  def save(sensors: Seq[Sensor])
}
