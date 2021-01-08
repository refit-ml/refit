package edu.cdl.iot.demo.core.repository

import edu.cdl.iot.common.schema.Schema

trait SchemaRepository {
  def getSchema(projectGuid: String): Schema
}
