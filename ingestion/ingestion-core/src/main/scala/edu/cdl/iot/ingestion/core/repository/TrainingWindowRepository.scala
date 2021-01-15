package edu.cdl.iot.ingestion.core.repository

import edu.cdl.iot.common.domain.TrainingWindow

trait TrainingWindowRepository {
  def save(trainingWindow: Seq[TrainingWindow])
}
