package edu.cdl.iot.integrations.scheduler.jdbi.dependencies


import edu.cdl.iot.integrations.scheduler.jdbi.mapper.TrainingJobMapper
import edu.cdl.iot.integrations.scheduler.jdbi.repository.JdbiTrainingJobRepository
import org.jdbi.v3.core.Jdbi

class SchedulerJdbiDependencies(jdbi: Jdbi) {
  jdbi.registerRowMapper(new TrainingJobMapper)

  val trainingJobRepository = new JdbiTrainingJobRepository(jdbi)
}
