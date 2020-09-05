package edu.cdl.iot.camel.dto

class Annotation(name: String,
                 enabled: Boolean,
                 datasource: String = "REFIT",
                 showLine: Boolean = true) {
  def getName: String = name

  def getEnabled: Boolean = enabled

  def getDatasource: String = datasource

  def getShowLine: Boolean = showLine
}