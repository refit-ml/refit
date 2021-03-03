package edu.cdl.iot.integrations.notebook.core.repository

import java.util.UUID

import edu.cdl.iot.common.domain.TrainingWindow

trait NotebookTrainingWindowRepository {
  def find(projectGuid: UUID,
           sensorId: String,
           partitionKey: String): List[TrainingWindow]

  def save(trainingWindow: Seq[TrainingWindow])
}
