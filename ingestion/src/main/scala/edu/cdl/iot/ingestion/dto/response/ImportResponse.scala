package edu.cdl.iot.ingestion.dto.response

import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@JsonIgnoreProperties(ignoreUnknown = true)
class ImportResponse(var requestSuccessful: Boolean) {
  def this() = this(false)

  def getRequestSuccessful: Boolean = requestSuccessful
}