package edu.cdl.iot.common.schema

import edu.cdl.iot.common.schema.enums.FieldClassification.FeatureClassification
import edu.cdl.iot.common.schema.enums.{FieldClassification, FieldType}
import edu.cdl.iot.common.schema.enums.FieldType.FeatureType
import edu.cdl.iot.common.yaml.FieldYaml

case class Field(yaml: FieldYaml) {

  val name: String = yaml.name
  val `type`: FeatureType = FieldType.fromString(yaml.`type`)
  val classification: FeatureClassification = FieldClassification.fromString(yaml.classification)

  def getName: String = name

  def getType: String = `type`.toString

  def getClassification: String = classification.toString
}

object Field {
  def getClassifications(lst: List[(Field, Int)], featureClassification: FeatureClassification): List[(Field, Int)] =
    lst.filter(p => p._1.classification == featureClassification)

  def withFeatureType(lst: List[(Field, Int)], featureType: FeatureType): List[(Field, Int)] =
    lst.filter(p => p._1.`type` == featureType)

}