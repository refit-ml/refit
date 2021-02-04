package edu.cdl.iot.integrations.scheduler.core.repository

import edu.cdl.iot.integrations.scheduler.core.entity.{TrainingJob, TrainingJobError}

trait TrainingJobNotificationRepository {
  def save(trainingJob: TrainingJob): Either[Unit, TrainingJobError]
}
