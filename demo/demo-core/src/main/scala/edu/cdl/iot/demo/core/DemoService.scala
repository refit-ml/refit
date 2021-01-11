package edu.cdl.iot.demo.core

import java.util.UUID

import edu.cdl.iot.common.util.SensorDataHelper
import edu.cdl.iot.demo.core.repository.ProjectRepository
import edu.cdl.iot.protocol.SensorData.SensorData

class DemoService(projectRepository: ProjectRepository) {

  private val sensors = (1000 to 1100).toList


  def generateDemoData(projectGuid: UUID): SensorData = {
    val project = projectRepository.find(projectGuid)
    val schema = project.schema
    sensors.map(sensorId => SensorDataHelper.getRandomReadings(schema, sensorId.toString)).head
  }
}
