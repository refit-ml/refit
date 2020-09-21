package edu.cdl.iot.ingestion.dto.request

import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@JsonIgnoreProperties(ignoreUnknown = true)
class SchemaRequest(var path: String) {
  def this() = this(null)

  def getPath: String = path

}