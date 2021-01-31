package edu.cdl.iot.integrations.scheduler.jdbi.dependencies

import edu.cdl.iot.common.yaml.PostgresConfig
import edu.cdl.iot.data.postgres.factory.JdbiFactory
import edu.cdl.iot.integrations.scheduler.jdbi.mapper.TrainingJobMapper
import edu.cdl.iot.integrations.scheduler.jdbi.repository.JdbiTrainingJobRepository

class SchedulerJdbiDependencies(postgresConfig: PostgresConfig) {
  private val jdbi = new JdbiFactory(postgresConfig)
    .jdbi
    .registerRowMapper(new TrainingJobMapper)

  val trainingJobRepository = new JdbiTrainingJobRepository(jdbi)
}
