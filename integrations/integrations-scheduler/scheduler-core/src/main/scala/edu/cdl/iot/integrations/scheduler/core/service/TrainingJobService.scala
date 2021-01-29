package edu.cdl.iot.integrations.scheduler.core.service

import java.util.UUID

import edu.cdl.iot.integrations.scheduler.core.entity.{TrainingJob, TrainingJobDeployment, TrainingJobError}
import edu.cdl.iot.integrations.scheduler.core.repository.{TrainingJobDeploymentRepository, TrainingJobRepository}

class TrainingJobService(val trainingJobRepository: TrainingJobRepository,
                         val trainingJobDeploymentRepository: TrainingJobDeploymentRepository) {


  def saveTrainingJob(trainingJob: TrainingJob): Either[TrainingJobDeployment, TrainingJobError] =
    for (_ <- trainingJob.validate.left;
         trainingJobDeployment <- trainingJobDeploymentRepository.create(trainingJob).left)
      yield trainingJobDeployment

  def scheduleTrainingJob(projectGuid: UUID, jobName: String): Either[TrainingJobDeployment, TrainingJobError] =
    for( trainingJob <- trainingJobRepository.find(projectGuid, jobName).left;
         trainingJobDeployment <- trainingJobDeploymentRepository.create(trainingJob))
      yield trainingJobDeployment

  def forEachTrainingJob[T](closure: TrainingJob => T): List[T] =
    trainingJobRepository
      .find()
      .map(closure)
}
