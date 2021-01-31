package edu.cdl.iot.integrations.scheduler.core.repository

import edu.cdl.iot.integrations.scheduler.core.entity.{TrainingJob, TrainingJobDeployment, TrainingJobError}

trait TrainingJobDeploymentRepository {

  def create(trainingJob: TrainingJob): Either[TrainingJobDeployment, TrainingJobError]
}
