package edu.cdl.iot.integrations.notebook.core.service

import java.util.UUID
import edu.cdl.iot.common.domain.TrainingWindow
import edu.cdl.iot.integrations.notebook.core.repository.{NotebookPredictionRepository, NotebookProjectRepository, NotebookSensorRepository, NotebookTrainingWindowRepository}
import org.joda.time.DateTime
import org.slf4j.LoggerFactory

import java.io.File
import com.fasterxml.jackson.databind.json.JsonMapper
import com.fasterxml.jackson.module.scala.DefaultScalaModule

class NotebookQueryService(projectRepository: NotebookProjectRepository,
                           sensorRepository: NotebookSensorRepository,
                           sensorDataRepository: NotebookPredictionRepository,
                           trainingWindowRepository: NotebookTrainingWindowRepository,
                           uploadService: NotebookUploadService) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookQueryService])

  private def getSensors(sensors: List[String]): List[String] =
    if (sensors.isEmpty) sensorRepository.findAll
    else sensors

  def query(projectGuid: UUID,
            from: DateTime,
            to: DateTime,
            sensors: List[String]): UUID = {
    val schema = projectRepository.find(projectGuid).schema
    val partitions = schema.getPartitionsInRange(from, to)
    val dataObject = getSensors(sensors).flatMap(
      sensor => sensorDataRepository.find(
        projectGuid = projectGuid.toString,
        sensorId = sensor,
        partitions = partitions
      )
    )
    val transactionId = UUID.randomUUID()
    logger.info("Transaction Id created")
    val file_Object = File.createTempFile(transactionId.toString,".json")
    val filePath = file_Object.toPath.toString
    logger.info(s"Temporary File is created and the path of the file is: ${filePath}")
    val mapper = JsonMapper.builder()
      .addModule(DefaultScalaModule)
      .build()
    mapper.writeValue(file_Object, dataObject)
    uploadService.uploadFileObject(file_Object.getName,filePath)
    logger.info("Sensor data File uploaded on minio")
    transactionId
  }

  def uploadStatus(transactionID: String): Boolean = {
    var found = false
    try {
      uploadService.uploadFileStatus(transactionID)
      found = true
    } catch{
      case e:Exception => println(s"Could not find the file object on minio with transactionID: ${transactionID}")
      logger.info(s"${e.printStackTrace()}")
    }
    found
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
}
