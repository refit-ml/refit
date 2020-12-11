package edu.cdl.iot.ingestion.core.repository

import edu.cdl.iot.common.domain.Project
import edu.cdl.iot.common.schema.Schema

trait ProjectRepository {

  def getSchema(projectGuid: String): Schema

  def createProject(project: Project)

}
