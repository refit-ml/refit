package edu.cdl.iot.ingestion.core.service

import edu.cdl.iot.common.yaml.MinioConfig
import edu.cdl.iot.ingestion.core.dto.request.ImportRequest
import edu.cdl.iot.ingestion.core.factory.{SensorDataFactory, TrainingWindowFactory}
import edu.cdl.iot.ingestion.core.repository.{FileRepository, ProjectRepository, SensorDataRepository, TrainingWindowRepository}

class ImportService(minioConfig: MinioConfig,
                    fileRepository: FileRepository,
                    projectRepository: ProjectRepository,
                    sensorDataRepository: SensorDataRepository,
                    trainingWindowRepository: TrainingWindowRepository) {

  def performSensorDataImport(request: ImportRequest): Unit = {
    val schema = projectRepository.getSchema(request.projectGuid)
    val lineIterator = fileRepository.lineIterator(minioConfig.buckets.`import`, request.filePath)


    if (request.importTrainingWindow) {
      val trainingWindowFactory = new TrainingWindowFactory(schema)
      lineIterator
        .drop(1)
        .map(x => trainingWindowFactory.fromCsv(x))
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
}
