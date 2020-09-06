package edu.cdl.iot.common.schema.enums


object FieldClassification extends Enumeration {
  type FeatureClassification = Value
  val Key, Timestamp, Label, Feature, ThrowAway = Value

  def fromString(name: String): Value =
    values.find(_.toString.toLowerCase == name.toLowerCase()).get

}