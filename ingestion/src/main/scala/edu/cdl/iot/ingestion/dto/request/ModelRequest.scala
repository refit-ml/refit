package edu.cdl.iot.ingestion.dto.request

import com.fasterxml.jackson.annotation.JsonIgnoreProperties


@JsonIgnoreProperties(ignoreUnknown = true)
class ModelRequest(var projectGuid: String,
                   var modelGuid: String,
                   var path: String) {
  def this() = this(null, null, null)

  def getModelGuid: String = modelGuid

  def getPath: String = path

  def getProjectGuid: String = projectGuid

}