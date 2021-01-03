package edu.cdl.iot.integrations.core.dto.request

import com.fasterxml.jackson.annotation.JsonIgnoreProperties


@JsonIgnoreProperties(ignoreUnknown = true)
class SearchRequest(var target: String) {
  def this() = this(null)

  def getTarget: String = target
}