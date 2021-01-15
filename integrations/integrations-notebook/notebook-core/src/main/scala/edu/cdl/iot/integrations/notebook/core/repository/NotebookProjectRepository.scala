package edu.cdl.iot.integrations.notebook.core.repository

import java.util.UUID

import edu.cdl.iot.common.domain.Project

trait NotebookProjectRepository {
  def find(projectGuid: UUID): Project

  def find: List[Project]

  def save(project: Project)
}
