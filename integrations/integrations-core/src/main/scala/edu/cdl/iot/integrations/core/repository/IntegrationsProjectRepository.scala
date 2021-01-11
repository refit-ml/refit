package edu.cdl.iot.integrations.core.repository

import java.util.UUID
import edu.cdl.iot.common.domain.Project

trait IntegrationsProjectRepository {
  def find(projectGuid: UUID): Project

  def find: List[Project]

  def save(project: Project)
}
