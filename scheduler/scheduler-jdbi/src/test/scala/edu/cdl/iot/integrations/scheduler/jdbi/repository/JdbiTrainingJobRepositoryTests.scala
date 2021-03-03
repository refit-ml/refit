package edu.cdl.iot.integrations.scheduler.jdbi.repository

import java.time.LocalDateTime
import java.util.UUID

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.data.postgres.factory.JdbiFactory
import edu.cdl.iot.integrations.scheduler.core.entity.TrainingJob
import edu.cdl.iot.integrations.scheduler.jdbi.dependencies.SchedulerJdbiDependencies
import org.scalatest.BeforeAndAfterEach
import org.scalatest.flatspec.AnyFlatSpec

class JdbiTrainingJobRepositoryTests extends AnyFlatSpec with BeforeAndAfterEach {
  private val refitConfig = new ConfigFactory(useEnvironment = false).getConfig
  private val postgresConfig = refitConfig.getPostgresConfig()
  private val jdbi = new JdbiFactory(postgresConfig)
    .jdbi
  private val repository = new SchedulerJdbiDependencies(jdbi)
    .trainingJobRepository

  private var trainingJob: TrainingJob = _


  override def beforeEach {
    trainingJob = new TrainingJob(
      projectGuid = UUID.randomUUID(),
      jobName = UUID.randomUUID().toString,
      cronExpression = UUID.randomUUID().toString,
      createdAt = LocalDateTime.of(2021, 1, 1, 1, 1)
    )
  }

  override def afterEach: Unit = {
    repository.delete(trainingJob.projectGuid, trainingJob.jobName)
  }

  "Training Job" should "save and be able to be fetched" in {
    val expected = trainingJob

    repository.save(expected)
    val actual = repository.find(expected.projectGuid, expected.jobName)
      .fold(
        trainingJob => trainingJob,
        error => throw new Exception()
      )
    assert(actual === expected)
  }

  "Training job" should "Overwrite existing entries" in {
    repository.save(trainingJob)
    val expected = trainingJob.copy(cronExpression = UUID.randomUUID().toString)
    repository.save(expected)
    val actualEntries = repository.find(trainingJob.projectGuid)

    assert(actualEntries === List(expected))


  }

  "Training job" should "Be able to delete" in {
    repository.save(trainingJob)
    val entries = repository.find(trainingJob.projectGuid)

    assert(entries.length === 1)
    repository.delete(trainingJob.projectGuid, trainingJob.jobName)
    val expected = repository.find(trainingJob.projectGuid)

    assert(expected.length === 0)
  }

  "Training Job" should "Be able to fetch all" in {
    repository.save(trainingJob)
    val entries = repository.find()

    assert(entries.contains(trainingJob))

  }
}
