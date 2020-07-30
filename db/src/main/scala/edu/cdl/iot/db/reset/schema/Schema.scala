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


class Schema(val name: String, val values: List[Feature]) extends java.io.Serializable {

  def getKey(row: Row): String =
    getClassifications(FeatureClassification.Key)
      .zipWithIndex
      .map(tuple => row(tuple._2))
      .mkString("_")

  def getTimestamp(row: Row): String =
    getClassifications(FeatureClassification.Timestamp)
      .zipWithIndex
      .map(tuple => row(tuple._2))
      .mkString("")

  private def getClassifications(featureClassification: FeatureClassification) = values.filter(p => p.classification == featureClassification)

  def getFeatures(row: Row): Map[String, String] =
    getClassifications(FeatureClassification.Feature)
      .zipWithIndex
      .map(tuple => (tuple._1.name.toLowerCase, row(tuple._2).toString))
      .toMap

  def getLabels(row: Row): Map[String, String] =
    getClassifications(FeatureClassification.Label)
      .zipWithIndex
      .map(tuple => (tuple._1.name.toLowerCase, row(tuple._2).toString))
      .toMap

  // TODO We will want to create actual type checks for this
  def validate(row: Row): Boolean = values.length == row.length

}