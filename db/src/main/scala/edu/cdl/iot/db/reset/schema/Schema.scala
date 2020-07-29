package edu.cdl.iot.db.reset.schema

import edu.cdl.iot.db.reset.schema.FeatureClassification.FeatureClassification
import edu.cdl.iot.db.reset.schema.FeatureType.FeatureType
import org.apache.spark.sql.Row


object FeatureClassification extends Enumeration {
  type FeatureClassification = Value
  val Key, Timestamp, Label, Feature, ThrowAway = Value
}

object FeatureType extends Enumeration {
  type FeatureType = Value
  val Integer, Double, String, Bit = Value
}

case class Feature(name: String,
                   columnType: FeatureType,
                   classification: FeatureClassification)


class Schema(val name: String, val values: List[Feature]) {

  def getKey(row: Row): String = values
    .filter(p => p.classification == FeatureClassification.Key)
    .map(x => row(values.indexOf(x)))
    .mkString("_")

  def getTimestamp(row: Row): String = values
    .filter(p => p.classification == FeatureClassification.Timestamp)
    .map(x => row(values.indexOf(x)))
    .mkString("")

  private def getFeatureList = values.filter(p => p.classification == FeatureClassification.Feature)

  def getFeatures(row: Row): Map[String, String] =
    getFeatureList.zipWithIndex
      .map(tuple => (tuple._1.name, row(tuple._2).toString))
      .toMap

  // TODO We will want to create actual type checks for this
  def validate(row: Row): Boolean = values.length == row.length

}