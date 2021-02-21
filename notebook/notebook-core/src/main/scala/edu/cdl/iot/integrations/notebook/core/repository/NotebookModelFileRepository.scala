package edu.cdl.iot.integrations.notebook.core.repository

trait NotebookModelFileRepository {
  def getModel(filePath: String): Array[Byte]
}
