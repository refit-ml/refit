package edu.cdl.iot.ingestion.core.dto.response

class ModelResponse(var requestSuccessful: Boolean) {
  def this() = this(false)

  def getRequestSuccessful: Boolean = requestSuccessful
}