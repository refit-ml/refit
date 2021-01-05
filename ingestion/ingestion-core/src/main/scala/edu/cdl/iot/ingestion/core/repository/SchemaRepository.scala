package edu.cdl.iot.ingestion.core.repository

import edu.cdl.iot.common.schema.Schema

trait SchemaRepository {
  def getSchema(filePath: String): Schema
}