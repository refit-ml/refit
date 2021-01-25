package edu.cdl.iot.integrations.scheduler.core.service

import edu.cdl.iot.integrations.scheduler.core.entity.TrainingJob
import edu.cdl.iot.integrations.scheduler.core.repository.TrainingJobRepository

class TrainingJobService(val trainingJobRepository: TrainingJobRepository) {

  def fetchTrainingJobs(): List[TrainingJob] = trainingJobRepository.find()
}
