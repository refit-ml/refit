package edu.cdl.iot.integrations.notebook.core.repository

trait NotebookUploadFileRepository {
  def uploadFile(fileName: String, filePath: String)

  def uploadFileStatus(fileName: String)
}
