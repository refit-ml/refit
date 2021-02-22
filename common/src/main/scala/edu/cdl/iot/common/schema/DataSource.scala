package edu.cdl.iot.common.schema

import edu.cdl.iot.common.yaml.DataSourceYaml
import collection.JavaConverters._


case class DataSource(yaml: DataSourceYaml) {
  val fields: List[Field] = yaml.fields.asScala.toList.map(Field)
  val name: String = yaml.name
}