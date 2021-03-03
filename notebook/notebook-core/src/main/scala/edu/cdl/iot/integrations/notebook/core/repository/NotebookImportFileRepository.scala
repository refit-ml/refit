package edu.cdl.iot.integrations.notebook.core.repository

trait NotebookImportFileRepository {

  def lineIterator(bucketName: String, key: String): Iterator[String]

  def fileBytes(bucketName: String, key: String)

  def deleteFile(bucketName: String, key: String)

}
