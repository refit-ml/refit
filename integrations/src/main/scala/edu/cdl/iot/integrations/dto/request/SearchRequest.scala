package edu.cdl.iot.integrations.dto.request

import com.fasterxml.jackson.annotation.{JsonIgnoreProperties, JsonProperty}


@JsonIgnoreProperties(ignoreUnknown = true)
class SearchRequest(var target: String) {
  def this() = this(null)

  def getTarget: String = target
}