package edu.cdl.iot.integrations.notebook.core.service

import java.sql.Timestamp
import java.time.Instant
import java.util.UUID

import com.google.protobuf.ByteString
import edu.cdl.iot.common.domain.{Organization, Project, TrainingWindow}
import edu.cdl.iot.integrations.notebook.core.entity.{FileImport, SchemaImport}
import edu.cdl.iot.integrations.notebook.core.repository.{NotebookImportRepository, NotebookModelFileRepository, NotebookModelRepository, NotebookOrganizationRepository, NotebookProjectRepository, NotebookSchemaRepository, NotebookSensorDataRepository, NotebookSensorRepository, NotebookTrainingWindowRepository}
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}
import org.joda.time.DateTime
import edu.cdl.iot.integrations.notebook.core.entity.{Model => ModelRequest}


class NotebookIntegrationService(projectRepository: NotebookProjectRepository,
                                 sensorRepository: NotebookSensorRepository,
                                 sensorDataRepository: NotebookSensorDataRepository,
                                 trainingWindowRepository: NotebookTrainingWindowRepository,
                                 importRepository: NotebookImportRepository,
                                 schemaRepository: NotebookSchemaRepository,
                                 organizationRepository: NotebookOrganizationRepository,
                                 modelRepository: NotebookModelRepository,
                                 modelFileRepository: NotebookModelFileRepository) {

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


  def saveImportRequest(projectGuid: UUID, importRequest: FileImport): Unit =
    importRepository.save(importRequest.envelope(projectGuid))


  def createProject(request: SchemaImport): Unit = {
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


  def updateModel(projectGuid: UUID, request: ModelRequest): Project = {
    val project = projectRepository.find(projectGuid)
    val modelGuid = UUID.fromString(request.modelGuid)
    val updatedProject = project.copy(modelGuid = modelGuid)
    val bytes = modelFileRepository.getModel(request.path)
    val model = Model(
      projectGuid = projectGuid.toString,
      key = request.modelGuid,
      bytes = ByteString.copyFrom(bytes),
      format = SerializationFormat.ONNX,
      inputValues = request.getInputFields
    )

    projectRepository.save(updatedProject)
    modelRepository.save(model)

    updatedProject
  }
}
