package edu.cdl.iot.scheduler.kafka.repository

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.integrations.scheduler.core.entity.{TrainingJob, TrainingJobError}
import edu.cdl.iot.integrations.scheduler.core.repository.TrainingJobNotificationRepository
import edu.cdl.iot.protocol.TrainingJob.{TrainingJob => TrainingJobMessage}


class KafkaTrainingJobNotificationRepository(kafkaRepository: KafkaRepository) extends TrainingJobNotificationRepository {

  private val trainingJobScheduledTopic = kafkaRepository.topics.trainingJobScheduled

  override def save(trainingJob: TrainingJob): Either[Unit, TrainingJobError] = {
    val trainingJobMessage = TrainingJobMessage(
      projectGuid = trainingJob.projectGuid.toString,
      jobName = trainingJob.jobName,
      cronExpression = trainingJob.cronExpression,
      createdAt = trainingJob.createdAt.toString
    )
    kafkaRepository.send(
      topic = trainingJobScheduledTopic,
      payload = trainingJobMessage.toByteArray
    )
    Left(Unit)
  }
}
