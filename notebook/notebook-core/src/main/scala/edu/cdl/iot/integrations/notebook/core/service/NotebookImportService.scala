package edu.cdl.iot.integrations.notebook.core.service

import java.util.UUID

import edu.cdl.iot.common.yaml.MinioConfig
import edu.cdl.iot.integrations.notebook.core.factory.{SensorDataFactory, TrainingWindowFactory}
import edu.cdl.iot.integrations.notebook.core.repository.{NotebookImportFileRepository, NotebookPredictionRepository, NotebookProjectRepository, NotebookSensorDataRepository, NotebookTrainingWindowRepository}
import edu.cdl.iot.protocol.ImportRequest.ImportRequest
import org.slf4j.LoggerFactory

class NotebookImportService(minioConfig: MinioConfig,
                            fileRepository: NotebookImportFileRepository,
                            projectRepository: NotebookProjectRepository,
                            sensorDataRepository: NotebookSensorDataRepository,
                            trainingWindowRepository: NotebookTrainingWindowRepository) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookImportService])

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
        .foreach(trainingWindowRepository.save)
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
}
