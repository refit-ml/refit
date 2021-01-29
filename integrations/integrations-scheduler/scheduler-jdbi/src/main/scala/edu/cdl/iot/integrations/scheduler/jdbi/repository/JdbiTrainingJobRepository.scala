package edu.cdl.iot.integrations.scheduler.jdbi.repository

import java.util.UUID

import edu.cdl.iot.integrations.scheduler.core.entity.TrainingJob
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

  override def find(projectGuid: UUID, name: String): TrainingJob = jdbi.withHandle(handle => {
    val dao = handle.attach(classOf[TrainingJobDao])
    dao.findTrainingJobById(projectGuid, name)
  })

  override def save(trainingJob: TrainingJob): Unit = jdbi.useHandle(handle => {
    val dao = handle.attach(classOf[TrainingJobDao])
    dao.save(projectGuid = trainingJob.projectGuid,
      name = trainingJob.jobName,
      cronExpression = trainingJob.cronExpression,
      createdAt = trainingJob.createdAt
    )
  })

  override def delete(trainingJob: TrainingJob): Unit = jdbi.useHandle(handle => {
    val dao = handle.attach(classOf[TrainingJobDao])
    dao.delete(trainingJob.projectGuid, trainingJob.jobName)
  })
}
