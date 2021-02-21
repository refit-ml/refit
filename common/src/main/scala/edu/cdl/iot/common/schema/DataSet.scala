package edu.cdl.iot.common.schema

import edu.cdl.iot.common.yaml.DataSetYaml
import collection.JavaConverters._


case class DataSet(yaml: DataSetYaml) {
  val fields: List[Field] = yaml.fields.asScala.toList.map(Field)
  val name: String = yaml.name
}