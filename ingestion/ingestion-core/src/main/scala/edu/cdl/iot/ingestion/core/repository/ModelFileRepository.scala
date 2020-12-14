package edu.cdl.iot.ingestion.core.repository

trait ModelFileRepository {
  def getModel(key: String): Array[Byte]
}
