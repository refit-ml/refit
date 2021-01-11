package edu.cdl.iot.integrations.core.service

import java.util.UUID

import edu.cdl.iot.common.domain.{Project, TrainingWindow}
import edu.cdl.iot.integrations.core.repository.{IntegrationsProjectRepository, IntegrationsSensorDataRepository, IntegrationsSensorRepository, IntegrationsTrainingWindowRepository}
import org.joda.time.DateTime


class NotebookQueryService(projectRepository: IntegrationsProjectRepository,
                           sensorRepository: IntegrationsSensorRepository,
                           sensorDataRepository: IntegrationsSensorDataRepository,
                           trainingWindowRepository: IntegrationsTrainingWindowRepository) {

  private def getSensors(sensors: List[String]): List[String] =
    if (sensors.isEmpty) sensorRepository.getAllSensors
    else sensors

  def query(projectGuid: UUID,
            from: DateTime,
            to: DateTime,
            sensors: List[String]): List[Map[String, String]] = {
    val schema = projectRepository.find(projectGuid).schema
    val partitions = schema.getPartitionsInRange(from, to)
    getSensors(sensors).flatMap(
      sensor => sensorDataRepository.getSensorData(
        projectGuid = projectGuid.toString,
        sensorId = sensor,
        partitions = partitions
      )
    )
  }

  def trainingWindow(projectGuid: UUID,
                     from: DateTime,
                     to: DateTime,
                     sensors: List[String]): List[TrainingWindow] = {
    val project = projectRepository.find(projectGuid)
    val schema = project.schema
    val partitions = schema.getPartitionsInRange(from, to)

    getSensors(sensors).flatMap(
      sensor => partitions.flatMap(partition =>
        trainingWindowRepository.find(projectGuid, sensor, partition)
      )
    )
  }

  def project(projectGuid: UUID): Project =
    projectRepository.find(projectGuid)

  def putModel(projectGuid: UUID, modelGuid: UUID): Project = {
    val project = projectRepository.find(projectGuid)
    val updatedProject = project.copy(modelGuid = modelGuid)
    projectRepository.save(updatedProject)
    updatedProject
  }
}
