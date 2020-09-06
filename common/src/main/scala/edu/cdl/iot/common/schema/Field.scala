package edu.cdl.iot.common.schema

import edu.cdl.iot.common.schema.enums.FieldClassification.FeatureClassification
import edu.cdl.iot.common.schema.enums.{FieldClassification, FieldType}
import edu.cdl.iot.common.schema.enums.FieldType.FeatureType
import edu.cdl.iot.common.yaml.FieldYaml


case class Field(yaml: FieldYaml) {
  val name: String = yaml.name
  val `type`: FeatureType = FieldType.fromString(yaml.`type`)
  val classification: FeatureClassification = FieldClassification.fromString(yaml.classification)
}