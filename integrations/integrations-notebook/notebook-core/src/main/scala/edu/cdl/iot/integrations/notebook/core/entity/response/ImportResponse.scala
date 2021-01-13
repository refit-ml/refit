package edu.cdl.iot.integrations.notebook.core.entity.response

class ImportResponse(var requestSuccessful: Boolean) {
  def this() = this(false)

  def getRequestSuccessful: Boolean = requestSuccessful
}