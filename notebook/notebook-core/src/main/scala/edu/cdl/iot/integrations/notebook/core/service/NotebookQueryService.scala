package edu.cdl.iot.integrations.notebook.core.service

import java.util.UUID
import edu.cdl.iot.common.domain.TrainingWindow
import edu.cdl.iot.integrations.notebook.core.repository.{NotebookPredictionRepository, NotebookProjectRepository, NotebookSensorRepository, NotebookTrainingWindowRepository}
import org.joda.time.DateTime
import org.slf4j.LoggerFactory



class NotebookQueryService(projectRepository: NotebookProjectRepository,
                           sensorRepository: NotebookSensorRepository,
                           sensorDataRepository: NotebookPredictionRepository,
                           trainingWindowRepository: NotebookTrainingWindowRepository
                           ) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookQueryService])

  private def getSensors(sensors: List[String]): List[String] =
    if (sensors.isEmpty) sensorRepository.findAll
    else sensors

  def query(projectGuid: UUID,
            from: DateTime,
            to: DateTime,
            sensors: List[String]): List[Map[String, String]] = {
    val schema = projectRepository.find(projectGuid).schema
    val partitions = schema.getPartitionsInRange(from, to)
    val dataObject = getSensors(sensors).flatMap(
      sensor => sensorDataRepository.find(
        projectGuid = projectGuid.toString,
        sensorId = sensor,
        partitions = partitions
      )
    )
    dataObject
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
