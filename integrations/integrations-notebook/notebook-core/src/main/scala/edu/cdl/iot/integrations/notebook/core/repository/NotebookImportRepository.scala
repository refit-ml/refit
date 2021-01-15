package edu.cdl.iot.integrations.notebook.core.repository

import edu.cdl.iot.protocol.ImportRequest.ImportRequest

trait NotebookImportRepository {
  def save(importRequest: ImportRequest): Unit
}
