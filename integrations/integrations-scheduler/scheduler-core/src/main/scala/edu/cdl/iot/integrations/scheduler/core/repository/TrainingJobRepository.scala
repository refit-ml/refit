package edu.cdl.iot.integrations.scheduler.core.repository

import java.util.UUID

import edu.cdl.iot.integrations.scheduler.core.entity.TrainingJob

trait TrainingJobRepository {
  def find(): List[TrainingJob]

  def find(projectGuid: UUID): List[TrainingJob]

  def find(projectGuid: UUID, name: String): TrainingJob

  def save(trainingJob: TrainingJob)
}
