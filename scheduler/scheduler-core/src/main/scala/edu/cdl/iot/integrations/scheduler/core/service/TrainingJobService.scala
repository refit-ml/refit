package edu.cdl.iot.integrations.scheduler.core.service

import java.util.UUID

import edu.cdl.iot.integrations.scheduler.core.entity.{TrainingJob, TrainingJobDeployment, TrainingJobError}
import edu.cdl.iot.integrations.scheduler.core.repository.{TrainingJobDeploymentRepository, TrainingJobNotificationRepository, TrainingJobRepository}

class TrainingJobService(val trainingJobRepository: TrainingJobRepository,
                         val trainingJobDeploymentRepository: TrainingJobDeploymentRepository,
                         val trainingJobNotificationRepository: TrainingJobNotificationRepository) {


  def saveTrainingJob(trainingJob: TrainingJob): Either[TrainingJob, TrainingJobError] =
    for (_ <- trainingJob.validate.left;
         _ <- trainingJobRepository.save(trainingJob).left;
         _ <- trainingJobNotificationRepository.save(trainingJob).left)
      yield trainingJob

  def deleteTrainingJob(projectGuid: UUID, jobName: String): Either[TrainingJob, TrainingJobError] =
    for (trainingJob <- trainingJobRepository.find(projectGuid, jobName).left;
         _ <- trainingJobRepository.delete(projectGuid, jobName).left)
      yield trainingJob

  def scheduleTrainingJob(projectGuid: UUID, jobName: String): Either[TrainingJobDeployment, TrainingJobError] =
    for (trainingJob <- trainingJobRepository.find(projectGuid, jobName).left;
         trainingJobDeployment <- trainingJobDeploymentRepository.create(trainingJob))
      yield trainingJobDeployment

  def forEachTrainingJob[T](closure: TrainingJob => T): List[T] =
    trainingJobRepository
      .find()
      .map(closure)

}
