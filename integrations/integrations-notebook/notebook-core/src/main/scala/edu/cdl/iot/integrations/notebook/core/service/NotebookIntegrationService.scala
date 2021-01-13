package edu.cdl.iot.integrations.notebook.core.service

import java.sql.Timestamp
import java.time.Instant
import java.util.UUID

import edu.cdl.iot.common.domain.{Organization, Project, TrainingWindow}
import edu.cdl.iot.integrations.notebook.core.entity.request.{ImportRequest, SchemaRequest}
import edu.cdl.iot.integrations.notebook.core.repository.{NotebookImportRepository, NotebookOrganizationRepository, NotebookProjectRepository, NotebookSchemaRepository, NotebookSensorDataRepository, NotebookSensorRepository, NotebookTrainingWindowRepository}
import org.joda.time.DateTime


class NotebookIntegrationService(projectRepository: NotebookProjectRepository,
                                 sensorRepository: NotebookSensorRepository,
                                 sensorDataRepository: NotebookSensorDataRepository,
                                 trainingWindowRepository: NotebookTrainingWindowRepository,
                                 importRepository: NotebookImportRepository,
                                 schemaRepository: NotebookSchemaRepository,
                                 organizationRepository: NotebookOrganizationRepository) {

  private def getSensors(sensors: List[String]): List[String] =
    if (sensors.isEmpty) sensorRepository.findAll
    else sensors

  def query(projectGuid: UUID,
            from: DateTime,
            to: DateTime,
            sensors: List[String]): List[Map[String, String]] = {
    val schema = projectRepository.find(projectGuid).schema
    val partitions = schema.getPartitionsInRange(from, to)
    getSensors(sensors).flatMap(
      sensor => sensorDataRepository.find(
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


  def saveImportRequest(projectGuid: UUID, importRequest: ImportRequest): Unit =
    importRepository.save(importRequest.envelope(projectGuid))


  def createProject(request: SchemaRequest): Unit = {
    val schema = schemaRepository.findByPath(request.path)
    val organization = Organization(
      orgGuid = schema.orgGuid,
      timestamp = Timestamp.from(Instant.now()),
      name = schema.org
    )

    val project = Project(
      orgGuid = schema.orgGuid,
      projectGuid = schema.projectGuid,
      modelGuid = null,
      name = schema.name,
      description = "",
      timestamp = Timestamp.from(Instant.now()),
      schema = schema
    )

    organizationRepository.save(organization)
    projectRepository.save(project)
  }
}
