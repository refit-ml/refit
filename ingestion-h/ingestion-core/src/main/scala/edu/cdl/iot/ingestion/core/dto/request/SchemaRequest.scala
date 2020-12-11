package edu.cdl.iot.ingestion.core.dto.request

class SchemaRequest(var path: String) {
  def this() = this(null)

  def getPath: String = path

}