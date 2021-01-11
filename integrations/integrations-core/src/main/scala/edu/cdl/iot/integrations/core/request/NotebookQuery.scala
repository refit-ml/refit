package edu.cdl.iot.integrations.core.request

import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@JsonIgnoreProperties(ignoreUnknown = true)
class NotebookQuery(var projectGuid: String,
                    var from: String,
                    var to: String,
                    var sensors: Array[String]) {
  def this() = this("", "", "", Array())

  def getProjectGuid: String = projectGuid

  def getFrom: String = from

  def getTo: String = to

  def getSensors: Array[String] = sensors
}
