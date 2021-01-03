package edu.cdl.iot.integrations.core.repository

import edu.cdl.iot.common.schema.Schema

trait IntegrationsProjectRepository {
  def getSchema(projectGuid: String): Schema

  def getSchemas: List[Schema]

  def getProjects: List[String]
}
