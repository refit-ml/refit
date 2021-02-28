package edu.cdl.iot.integrations.notebook.core.service

import java.util.UUID

import edu.cdl.iot.common.yaml.MinioConfig
import edu.cdl.iot.integrations.notebook.core.factory.{SensorDataFactory, StaticDataFactory, TrainingWindowFactory}
import edu.cdl.iot.integrations.notebook.core.repository.{NotebookImportFileRepository, NotebookImportRepository, NotebookProjectRepository, NotebookSensorDataRepository, NotebookStaticDataImportRepository, NotebookStaticDataRepository, NotebookTrainingWindowImportRepository, NotebookTrainingWindowRepository}
import edu.cdl.iot.protocol.Import.Import
import edu.cdl.iot.integrations.notebook.core.entity.{Import => FileImport}
import edu.cdl.iot.protocol.StaticDataImport.StaticDataImport
import org.slf4j.LoggerFactory

class NotebookImportService(minioConfig: MinioConfig,
                            fileRepository: NotebookImportFileRepository,
                            projectRepository: NotebookProjectRepository,
                            sensorDataRepository: NotebookSensorDataRepository,
                            trainingWindowRepository: NotebookTrainingWindowRepository,
                            importRepository: NotebookImportRepository,
                            trainingWindowImportRepository: NotebookTrainingWindowImportRepository,
                            staticDataImportRepository: NotebookStaticDataImportRepository,
                            staticDataRepository: NotebookStaticDataRepository) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookImportService])

  def saveImportRequest(projectGuid: UUID, importRequest: FileImport): Unit =
    importRepository.save(importRequest.toProto(projectGuid))


  def saveTrainingWindowImportRequest(projectGuid: UUID, importRequest: FileImport): Unit =
    trainingWindowImportRepository.save(importRequest.toProto(projectGuid))


  def saveStaticDataImportRequest(projectGuid: UUID, dataSource: String, importRequest: FileImport): Unit =
    staticDataImportRepository.save(importRequest.toStaticImportProto(projectGuid, dataSource))

  def performStaticDataImport(request: StaticDataImport): Unit = {
    logger.info("Start static data import")
    val projectGuid = UUID.fromString(request.projectGuid)
    val schema = projectRepository.find(projectGuid).schema
    val dataSource = schema.dataSources.filter(_.name == request.dataSource).head
    val lineIterator = fileRepository.lineIterator(minioConfig.buckets.`import`, request.filePath)
    val staticDataFactory = new StaticDataFactory(schema, dataSource)

    lineIterator
      .drop(1)
      .map(staticDataFactory.fromCsv)
      .foreach(staticDataRepository.save(schema.projectGuid, dataSource, _))

    if (request.deleteWhenComplete) {
      fileRepository.deleteFile(minioConfig.buckets.`import`, request.filePath)
    }

  }

  def performTrainingWindowImport(request: Import): Unit = {
    logger.info("Start training window import")
    val projectGuid = UUID.fromString(request.projectGuid)
    val schema = projectRepository.find(projectGuid).schema
    val lineIterator = fileRepository.lineIterator(minioConfig.buckets.`import`, request.filePath)

    val trainingWindowFactory = new TrainingWindowFactory(schema)
    lineIterator
      .drop(1)
      .map(x => trainingWindowFactory.fromCsv(x))
      .grouped(10)
      .foreach(trainingWindowRepository.save)

    if (request.deleteWhenComplete) {
      fileRepository.deleteFile(minioConfig.buckets.`import`, request.filePath)
    }

  }

  def performSensorDataImport(request: Import): Unit = {
    logger.info("Start sensor data import")
    val projectGuid = UUID.fromString(request.projectGuid)
    val schema = projectRepository.find(projectGuid).schema
    val lineIterator = fileRepository.lineIterator(minioConfig.buckets.`import`, request.filePath)


    val sensorDataFactory = new SensorDataFactory(schema)
    lineIterator
      .drop(1)
      .map(x => sensorDataFactory.fromCsv(x))
      .foreach(sensorDataRepository.createSensorData)


    if (request.deleteWhenComplete) {
      fileRepository.deleteFile(minioConfig.buckets.`import`, request.filePath)
    }
  }
}
