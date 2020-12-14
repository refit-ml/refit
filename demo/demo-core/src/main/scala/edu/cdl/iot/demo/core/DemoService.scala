package edu.cdl.iot.demo.core

import edu.cdl.iot.common.util.SensorDataHelper
import edu.cdl.iot.demo.core.repository.SchemaRepository
import edu.cdl.iot.protocol.SensorData.SensorData

class DemoService(schemaRepository: SchemaRepository) {

  private val sensors = (1000 to 1100).toList


  def generateDemoData(projectGuid: String): SensorData = {
    val schema = schemaRepository.getSchema(projectGuid)
    sensors.map(sensorId => SensorDataHelper.getRandomReadings(schema, sensorId.toString)).head
  }
}
