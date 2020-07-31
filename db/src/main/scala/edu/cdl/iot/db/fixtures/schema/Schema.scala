package edu.cdl.iot.db.fixtures.schema

import java.util.UUID

import edu.cdl.iot.db.fixtures.schema.FeatureClassification.FeatureClassification
import edu.cdl.iot.db.fixtures.schema.FeatureType.FeatureType
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


class Schema(val name: String,
             val projectGuid: UUID,
             val values: List[Feature],
             val includesHeader: Boolean = false) extends java.io.Serializable {


  def getKey(row: Row): String =
    getClassifications(values.zipWithIndex, FeatureClassification.Key)
      .map(tuple => row(tuple._2))
      .mkString("_")

  def getTimestamp(row: Row): String =
    getClassifications(values.zipWithIndex, FeatureClassification.Timestamp)
      .map(tuple => row(tuple._2))
      .mkString("")


  private def getClassifications(lst: List[(Feature, Int)], featureClassification: FeatureClassification) = lst.filter(p => p._1.classification == featureClassification)

  def getFeatures(row: Row): Map[String, String] =
    getClassifications(values.zipWithIndex, FeatureClassification.Feature)
      .map(tuple => (tuple._1.name.toLowerCase, row(tuple._2).toString))
      .toMap

  def getLabels(row: Row): Map[String, String] =
    getClassifications(values.zipWithIndex, FeatureClassification.Label)
      .map(tuple => (tuple._1.name.toLowerCase, row(tuple._2).toString))
      .toMap

  // TODO We will want to create actual type checks for this
  def validate(row: Row): Boolean = values.length == row.length

}