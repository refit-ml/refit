package edu.cdl.iot.integrations.notebook.core.repository

import edu.cdl.iot.common.schema.Schema

trait NotebookSchemaRepository {
  def findByPath(filePath: String): Schema
}
