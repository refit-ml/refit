package edu.cdl.iot.common.schema

import scala.beans.BeanProperty

class ImportOptionsYaml extends Serializable {
  @BeanProperty var fileName: String = _
  @BeanProperty var includesHeader: Boolean = false
}

case class ImportOptions(yaml: ImportOptionsYaml) {
  val fileName: String = yaml.fileName
  val includesHeader: Boolean = yaml.includesHeader
}