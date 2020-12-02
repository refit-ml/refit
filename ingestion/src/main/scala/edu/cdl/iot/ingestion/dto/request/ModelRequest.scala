package edu.cdl.iot.ingestion.dto.request

import com.fasterxml.jackson.annotation.JsonIgnoreProperties


@JsonIgnoreProperties(ignoreUnknown = true)
class ModelRequest(var projectGuid: String,
                   var modelGuid: String,
                   var path: String,
                   var inputFields: List[String]) {
  def this() = this(null, null, null, null)

  def getModelGuid: String = modelGuid

  def getPath: String = path

  def getProjectGuid: String = projectGuid

  def getInputFields: List[String] = inputFields

}