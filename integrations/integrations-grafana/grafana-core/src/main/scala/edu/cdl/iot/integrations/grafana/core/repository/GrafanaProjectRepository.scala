package edu.cdl.iot.integrations.grafana.core.repository

import java.util.UUID

import edu.cdl.iot.common.domain.Project

trait GrafanaProjectRepository {
  def find(projectGuid: UUID): Project

  def find: List[Project]

  def save(project: Project)
}
