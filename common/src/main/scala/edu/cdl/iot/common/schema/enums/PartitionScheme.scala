package edu.cdl.iot.common.schema.enums

object PartitionScheme extends Enumeration {
  type Scheme = Value
  val DAY, HOUR, MINUTE = Value

  def fromString(name: String): Value =
    values.find(_.toString.toLowerCase == name.toLowerCase()).get
}