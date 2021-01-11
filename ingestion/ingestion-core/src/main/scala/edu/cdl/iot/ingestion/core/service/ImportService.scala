package edu.cdl.iot.ingestion.core.service

import java.util.UUID

import edu.cdl.iot.common.yaml.MinioConfig
import edu.cdl.iot.ingestion.core.dto.request.ImportRequest
import edu.cdl.iot.ingestion.core.factory.{SensorDataFactory, TrainingWindowFactory}
import edu.cdl.iot.ingestion.core.repository.{ImportFileRepository, ImportRepository, ProjectRepository, SensorDataRepository, TrainingWindowRepository}
import org.slf4j.LoggerFactory

class ImportService(minioConfig: MinioConfig,
                    fileRepository: ImportFileRepository,
                    projectRepository: ProjectRepository,
                    sensorDataRepository: SensorDataRepository,
                    trainingWindowRepository: TrainingWindowRepository,
                    importRepository: ImportRepository) {
  private val logger = LoggerFactory.getLogger(classOf[ImportService])

  def performSensorDataImport(request: ImportRequest): Unit = {
    val projectGuid = UUID.fromString(request.projectGuid)
    val schema = projectRepository.find(projectGuid).schema
    val lineIterator = fileRepository.lineIterator(minioConfig.buckets.`import`, request.filePath)

    if (request.importTrainingWindow) {
      logger.info("Start training window import")
      val trainingWindowFactory = new TrainingWindowFactory(schema)
      lineIterator
        .drop(1)
        .map(x => trainingWindowFactory.fromCsv(x))
        .grouped(10)
        .foreach(trainingWindowRepository.createTrainingWindow)
    }
    else {
      logger.info("Start sensor data import")
      val sensorDataFactory = new SensorDataFactory(schema)
      lineIterator
        .drop(1)
        .map(x => sensorDataFactory.fromCsv(x))
        .foreach(sensorDataRepository.createSensorData)
    }

    if (request.deleteWhenComplete) {
      fileRepository.deleteFile(minioConfig.buckets.`import`, request.filePath)
    }

  }

  def saveImportRequest(importRequest: ImportRequest): Unit = importRepository.saveImportRequest(importRequest.envelope)
}
