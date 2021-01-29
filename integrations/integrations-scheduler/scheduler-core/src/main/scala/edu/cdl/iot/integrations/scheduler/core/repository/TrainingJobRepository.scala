package edu.cdl.iot.integrations.scheduler.core.repository

import java.util.UUID

import edu.cdl.iot.integrations.scheduler.core.entity.{TrainingJob, TrainingJobError}

trait TrainingJobRepository {
  def find(): List[TrainingJob]

  def find(projectGuid: UUID): List[TrainingJob]

  def find(projectGuid: UUID, name: String): Either[TrainingJob, TrainingJobError]

  def save(trainingJob: TrainingJob)

  def delete(trainingJob: TrainingJob)
}
