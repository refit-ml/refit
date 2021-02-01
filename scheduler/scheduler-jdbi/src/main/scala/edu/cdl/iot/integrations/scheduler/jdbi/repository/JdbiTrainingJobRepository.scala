package edu.cdl.iot.integrations.scheduler.jdbi.repository

import java.util.UUID

import edu.cdl.iot.integrations.scheduler.core.entity.{TrainingJob, TrainingJobError, TrainingJobNotFound}
import edu.cdl.iot.integrations.scheduler.core.repository.TrainingJobRepository
import edu.cdl.iot.integrations.scheduler.jdbi.dao.TrainingJobDao
import org.jdbi.v3.core.Jdbi

import scala.collection.JavaConverters.collectionAsScalaIterableConverter

class JdbiTrainingJobRepository(val jdbi: Jdbi) extends TrainingJobRepository {
  override def find(): List[TrainingJob] = jdbi.withHandle(handle => {
    val dao = handle.attach(classOf[TrainingJobDao])
    dao.findAllTrainingJobs().asScala.toList
  })

  override def find(projectGuid: UUID): List[TrainingJob] = jdbi.withHandle(handle => {
    val dao = handle.attach(classOf[TrainingJobDao])
    dao.findTrainingJobsInProject(projectGuid).asScala.toList
  })

  override def find(projectGuid: UUID, name: String): Either[TrainingJob, TrainingJobError] = jdbi.withHandle(handle => {
    val dao = handle.attach(classOf[TrainingJobDao])

    val trainingJob = dao.findTrainingJobById(projectGuid, name)
    if (trainingJob == null)
      Right(TrainingJobNotFound(projectGuid, name))
    else
      Left(dao.findTrainingJobById(projectGuid, name))

  })

  override def save(trainingJob: TrainingJob): Either[Unit, TrainingJobError] = jdbi.withHandle(handle => {
    val dao = handle.attach(classOf[TrainingJobDao])
    Left(dao.save(projectGuid = trainingJob.projectGuid,
      name = trainingJob.jobName,
      cronExpression = trainingJob.cronExpression,
      createdAt = trainingJob.createdAt
    ))
  })

  override def delete(projectGuid: UUID, name: String): Either[Unit, TrainingJobError] = jdbi.withHandle(handle => {
    val dao = handle.attach(classOf[TrainingJobDao])
    Left(dao.delete(projectGuid, name))
  })
}
