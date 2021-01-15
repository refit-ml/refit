package edu.cdl.iot.integrations.notebook.core.entity.request

class SchemaRequest(var path: String) {
  def this() = this(null)

  def getPath: String = path

}