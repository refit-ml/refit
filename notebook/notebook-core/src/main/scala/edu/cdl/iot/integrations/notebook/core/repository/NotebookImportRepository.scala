package edu.cdl.iot.integrations.notebook.core.repository

import edu.cdl.iot.protocol.Import.Import
import edu.cdl.iot.protocol.StaticDataImport.StaticDataImport


trait NotebookImportRepository {
  def save(importRequest: Import): Unit
}

trait NotebookStaticDataImportRepository {
  def save(importRequest: StaticDataImport): Unit
}

trait NotebookTrainingWindowImportRepository {
  def save(importRequest: Import): Unit
}
