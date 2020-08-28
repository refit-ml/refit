package edu.cdl.iot.common.schema.enums

object FieldType extends Enumeration {
  type FeatureType = Value
  val Integer, Double, String, Bit = Value

  def fromString(name: String): Value =
    values.find(_.toString.toLowerCase == name.toLowerCase()).get
}