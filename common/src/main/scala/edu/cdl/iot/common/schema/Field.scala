package edu.cdl.iot.common.schema

import edu.cdl.iot.common.schema.FieldClassification.FeatureClassification
import edu.cdl.iot.common.schema.FieldType.{FeatureType, values}

import scala.beans.BeanProperty

object FieldClassification extends Enumeration {
  type FeatureClassification = Value
  val Key, Timestamp, Label, Feature, ThrowAway = Value

  def fromString(name: String): Value =
    values.find(_.toString.toLowerCase == name.toLowerCase()).get

}

object FieldType extends Enumeration {
  type FeatureType = Value
  val Integer, Double, String, Bit = Value

  def fromString(name: String): Value =
    values.find(_.toString.toLowerCase == name.toLowerCase()).get
}

case class Field(yaml: FieldYaml) {
  val name: String = yaml.name
  val `type`: FeatureType = FieldType.fromString(yaml.`type`)
  val classification: FeatureClassification = FieldClassification.fromString(yaml.classification)
}

class FieldYaml extends Serializable {
  @BeanProperty var name: String = _
  @BeanProperty var `type`: String = _
  @BeanProperty var classification: String = _
}