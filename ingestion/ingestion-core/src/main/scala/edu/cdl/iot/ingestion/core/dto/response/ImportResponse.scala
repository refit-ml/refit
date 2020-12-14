package edu.cdl.iot.ingestion.core.dto.response

class ImportResponse(var requestSuccessful: Boolean) {
  def this() = this(false)

  def getRequestSuccessful: Boolean = requestSuccessful
}