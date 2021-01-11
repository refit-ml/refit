package edu.cdl.iot.integrations.core.repository

import java.util.UUID

import edu.cdl.iot.common.domain.TrainingWindow

trait IntegrationsTrainingWindowRepository {
  def find(projectGuid: UUID,
           sensorId: String,
           partitionKey: String): List[TrainingWindow]
}
