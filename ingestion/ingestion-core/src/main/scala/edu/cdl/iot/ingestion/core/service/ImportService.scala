package edu.cdl.iot.ingestion.core.service

import edu.cdl.iot.common.yaml.MinioConfig
import edu.cdl.iot.ingestion.core.dto.request.ImportRequest
import edu.cdl.iot.ingestion.core.factory.{SensorDataFactory, TrainingWindowFactory}
import edu.cdl.iot.ingestion.core.repository.{ImportFileRepository, ImportRepository, ProjectRepository, SensorDataRepository, TrainingWindowRepository}

class ImportService(minioConfig: MinioConfig,
                    fileRepository: ImportFileRepository,
                    projectRepository: ProjectRepository,
                    sensorDataRepository: SensorDataRepository,
                    trainingWindowRepository: TrainingWindowRepository,
                    importRepository: ImportRepository) {

  def performSensorDataImport(request: ImportRequest): Unit = {
    val schema = projectRepository.getSchema(request.projectGuid)
    val lineIterator = fileRepository.lineIterator(minioConfig.buckets.`import`, request.filePath)


    if (request.importTrainingWindow) {
      val trainingWindowFactory = new TrainingWindowFactory(schema)
      lineIterator
        .drop(1)
        .map(x => trainingWindowFactory.fromCsv(x))
        .grouped(10)
        .foreach(trainingWindowRepository.createTrainingWindow)
    }
    else {
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
