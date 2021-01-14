package edu.cdl.iot.integrations.notebook.core.entity

class SchemaImport(var path: String) {
  def this() = this(null)

  def getPath: String = path

}