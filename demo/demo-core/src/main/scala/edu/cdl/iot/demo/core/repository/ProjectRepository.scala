package edu.cdl.iot.demo.core.repository

import java.util.UUID

import edu.cdl.iot.common.domain.Project

trait ProjectRepository {
  def find(projectGuid: UUID): Project
}
