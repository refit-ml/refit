package edu.cdl.iot.ingestion.core.repository

import edu.cdl.iot.common.domain.TrainingWindow

trait TrainingWindowRepository {
  def createTrainingWindow(trainingWindow: TrainingWindow)

  def createTrainingWindow(trainingWindow: Seq[TrainingWindow])
}
