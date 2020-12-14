package edu.cdl.iot.ingestion.core.repository

trait ImportFileRepository {

  def lineIterator(bucketName: String, key: String): Iterator[String]

  def fileBytes(bucketName: String, key: String)

  def deleteFile(bucketName: String, key: String)

}
