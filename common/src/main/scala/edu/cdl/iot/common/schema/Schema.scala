package edu.cdl.iot.common.schema

import java.util.UUID

import edu.cdl.iot.common.schema.enums.{FieldClassification, FieldType, PartitionScheme}
import edu.cdl.iot.common.schema.enums.FieldClassification.FeatureClassification
import edu.cdl.iot.common.schema.enums.FieldType.FeatureType
import edu.cdl.iot.common.yaml.SchemaYaml
import org.joda.time.DateTime
import org.yaml.snakeyaml.Yaml

import collection.JavaConverters._

case class Schema(yaml: SchemaYaml) {
  val org: String = yaml.org
  val orgGuid: UUID = UUID.fromString(yaml.orgGuid)
  val name: String = yaml.name
  val projectGuid: UUID = UUID.fromString(yaml.projectGuid)
  val fields: List[Field] = yaml.fields.asScala.toList.map(Field)
  val importOptions: ImportOptions = ImportOptions(yaml.importOptions)
  val partitionScheme: PartitionScheme.Value = PartitionScheme.fromString(yaml.partitionScheme)
  val featureType: FeatureType = FieldType.fromString(yaml.featureType)

  def toYaml: String = (new Yaml).dumpAsMap(yaml)

  def getPartitionString(date: DateTime): String = {
    val pattern = partitionScheme match {
      case PartitionScheme.DAY => "yyyy-MM-dd"
      case PartitionScheme.HOUR => "yyyy-MM-dd HH"
      case PartitionScheme.MINUTE => "yyyy-MM-dd HH:mm"
    }
    date.toString(pattern)
  }

  def getNextPartition(date: DateTime): DateTime = {
    partitionScheme match {
      case PartitionScheme.DAY => date.plusDays(1)
      case PartitionScheme.HOUR => date.plusHours(1)
      case PartitionScheme.MINUTE => date.plusMinutes(1)
    }
  }

  def getFileName: String = (if (importOptions == null || importOptions.fileName == null) name else s"$name.csv").toLowerCase()

  def getKey(row: Array[String]): String =
    getClassifications(fields.zipWithIndex, FieldClassification.Key)
      .map(tuple => row(tuple._2))
      .mkString("_")

  def getTimestamp(row: Array[String]): String =
    getClassifications(fields.zipWithIndex, FieldClassification.Timestamp)
      .map(tuple => row(tuple._2))
      .mkString("")


  private def getClassifications(lst: List[(Field, Int)], featureClassification: FeatureClassification) = lst.filter(p => p._1.classification == featureClassification)

  private def withFeatureType(lst: List[(Field, Int)], featureType: FeatureType) = lst.filter(p => p._1.`type` == featureType)

  def getFeatures(row: Array[String]): Map[String, String] =
    getClassifications(fields.zipWithIndex, FieldClassification.Feature)
      .map(tuple => (tuple._1.name.toLowerCase, row(tuple._2)))
      .toMap

  def getFeaturesWithType(row: Array[String], featureType: FeatureType): Map[String, String] =
    withFeatureType(
      getClassifications(fields.zipWithIndex, FieldClassification.Feature),
      featureType)
      .map(tuple => (tuple._1.name.toLowerCase, row(tuple._2)))
      .toMap

  def getLabels(row: Array[String]): Map[String, String] =
    getClassifications(fields.zipWithIndex, FieldClassification.Label)
      .filter(tuple => tuple._2 < row.length)
      .map(tuple => (tuple._1.name.toLowerCase, row(tuple._2)))
      .toMap

  // TODO We will want to create actual type checks for this
  def validate(row: Array[String]): Boolean = fields.length == row.length
}

