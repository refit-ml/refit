package edu.cdl.iot.ingestion.core.factory

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.schema.enums.FieldType
import edu.cdl.iot.protocol.SensorData.SensorData

class SensorDataFactory(val schema: Schema) {

  def toDouble(x: String): Double = {
    try {
      x.toDouble
    }
    catch {
      case ex: NumberFormatException => 0.0
    }
  }

  def toInt(x: String): Int = {
    try {
      x.toInt
    }
    catch {
      case ex: NumberFormatException => 0
    }
  }

  def fromDelimited(row: Array[String]): SensorData = {
    val key = schema.getKey(row)
    val timestampParts = schema.getTimestamp(row).split("\t")
    val timestamp = timestampParts(0).replace(".0", "")
    val doubles = schema.getFeaturesWithType(row, FieldType.Double)
      .map(x => x._1 -> toDouble(x._2))
    val strings = schema.getFeaturesWithType(row, FieldType.String)
    val integers = schema.getFeaturesWithType(row, FieldType.Integer)
      .map(x => x._1 -> toInt(x._2))
    val features = schema.getFeatures(row)
    val labels = schema.getLabels(row)
    SensorData(schema.projectGuid.toString,
      key,
      timestamp,
      doubles,
      strings,
      integers,
      labels
    )
  }

  def fromCsv(line: String): SensorData = fromDelimited(line.split(",").map(_.trim))


  def fromTsv(line: String): SensorData = fromDelimited(line.split("\t").map(_.trim))
}

