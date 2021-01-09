package edu.cdl.iot.integrations.core.service

import edu.cdl.iot.integrations.core.repository.{IntegrationsProjectRepository, IntegrationsSensorDataRepository, IntegrationsSensorRepository}
import edu.cdl.iot.integrations.core.request.NotebookQuery
import org.joda.time.DateTime


class NotebookQueryService(projectRepository: IntegrationsProjectRepository,
                           sensorRepository: IntegrationsSensorRepository,
                           sensorDataRepository: IntegrationsSensorDataRepository) {

  private def getSensors(sensors: List[String]): List[String] =
    if (sensors.isEmpty) sensorRepository.getAllSensors
    else sensors

  def query(projectGuid: String,
            from: DateTime,
            to: DateTime,
            sensors: List[String]): List[Map[String, String]] = {
    val schema = projectRepository.getSchema(projectGuid)
    val partitions = schema.getPartitionsInRange(from, to)
    getSensors(sensors).flatMap(
      sensor => sensorDataRepository.getSensorData(
        projectGuid = projectGuid,
        sensorId = sensor,
        partitions = partitions
      )
    )
  }
}
