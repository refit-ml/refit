package edu.cdl.iot.integrations.notebook.core.repository

import edu.cdl.iot.common.domain.Sensor

trait NotebookSensorRepository {
  def findAll: List[String]
  def findAll(projectGuid: String): List[String]
  def save(sensors: Seq[Sensor])
}
