package edu.cdl.iot.common.schema

import edu.cdl.iot.common.schema.Field.{getClassifications, withFeatureType}
import edu.cdl.iot.common.schema.enums.FieldClassification
import edu.cdl.iot.common.schema.enums.FieldType.FeatureType
import edu.cdl.iot.common.yaml.DataSourceYaml

import collection.JavaConverters._


case class DataSource(yaml: DataSourceYaml) {
  val fields: List[Field] = yaml.fields.asScala.toList.map(x => Field(x))
  val name: String = yaml.name

  def getKey(row: Array[String]): String =
    getClassifications(fields.zipWithIndex, FieldClassification.Key)
      .map(tuple => row(tuple._2))
      .mkString("_")

  def getTimestamp(row: Array[String]): String =
    getClassifications(fields.zipWithIndex, FieldClassification.Timestamp)
      .map(tuple => row(tuple._2))
      .mkString("")


  def getFeatures(row: Array[String]): Map[String, String] =
    getClassifications(fields.zipWithIndex, FieldClassification.Feature)
      .filter(tuple => tuple._2 < row.length)
      .map(tuple => (tuple._1.name.toLowerCase, row(tuple._2)))
      .toMap

  def getFeaturesWithType(row: Array[String], featureType: FeatureType): Map[String, String] =
    withFeatureType(
      getClassifications(fields.zipWithIndex, FieldClassification.Feature),
      featureType)
      .filter(tuple => tuple._2 < row.length)
      .map(tuple => (tuple._1.name.toLowerCase, row(tuple._2)))
      .toMap
}