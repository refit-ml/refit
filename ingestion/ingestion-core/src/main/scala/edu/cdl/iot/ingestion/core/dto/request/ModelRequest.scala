package edu.cdl.iot.ingestion.core.dto.request

import scala.collection.JavaConverters._

class ModelRequest(var projectGuid: String,
                   var modelGuid: String,
                   var path: String,
                   var inputFields: java.util.List[String]) {
  def this() = this(null, null, null, null)


  def getModelGuid: String = modelGuid

  def getPath: String = path

  def getProjectGuid: String = projectGuid

  def getInputFields: List[String] = inputFields.asScala.toList

}