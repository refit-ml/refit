package edu.cdl.iot.integrations.dto.request

import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@JsonIgnoreProperties(ignoreUnknown = true)
class TagRequest(var key: String) {
  def this() = this(null)

  def getKey: String = key
}