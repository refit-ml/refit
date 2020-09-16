package edu.cdl.iot.camel.dto.response

import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@JsonIgnoreProperties(ignoreUnknown = true)
class TagResponse(var text: String,
                 var `type`: String = "string") {
  def this() = this(null)

  def getText: String = text

  def getType: String = `type`
}
