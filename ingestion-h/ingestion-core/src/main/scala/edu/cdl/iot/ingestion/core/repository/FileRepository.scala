package edu.cdl.iot.ingestion.core.repository

trait FileRepository {

  def lineIterator(bucketName: String, key: String): Iterator[String]

  def deleteFile(bucketName: String, key: String)

}
