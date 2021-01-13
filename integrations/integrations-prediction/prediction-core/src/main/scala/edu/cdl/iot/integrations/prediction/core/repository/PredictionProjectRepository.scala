package edu.cdl.iot.integrations.prediction.core.repository

import java.util.UUID

import edu.cdl.iot.common.domain.Project

trait PredictionProjectRepository {
  def find(projectGuid: UUID): Project

  def find: List[Project]

  def save(project: Project)
}
