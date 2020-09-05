package edu.cdl.iot.common.schema

import edu.cdl.iot.common.yaml.ImportOptionsYaml


case class ImportOptions(yaml: ImportOptionsYaml) {
  val fileName: String = yaml.fileName
  val includesHeader: Boolean = yaml.includesHeader
}