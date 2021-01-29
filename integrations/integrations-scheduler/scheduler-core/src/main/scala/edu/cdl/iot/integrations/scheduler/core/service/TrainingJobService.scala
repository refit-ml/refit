package edu.cdl.iot.integrations.scheduler.core.service

import edu.cdl.iot.integrations.scheduler.core.entity.{TrainingJob, TrainingJobDeployment, TrainingJobError}
import edu.cdl.iot.integrations.scheduler.core.repository.{TrainingJobDeploymentRepository, TrainingJobRepository}

class TrainingJobService(val trainingJobRepository: TrainingJobRepository,
                         val trainingJobDeploymentRepository: TrainingJobDeploymentRepository) {


  def saveTrainingJob(trainingJob: TrainingJob): Either[TrainingJobDeployment, TrainingJobError] =
    for (_ <- trainingJob.validate.left;
         trainingJobDeployment <- trainingJobDeploymentRepository.create(trainingJob).left)
      yield trainingJobDeployment


  def fetchTrainingJobs(): List[TrainingJob] = trainingJobRepository.find()
}
