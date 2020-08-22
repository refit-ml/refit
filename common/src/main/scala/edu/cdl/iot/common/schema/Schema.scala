package edu.cdl.iot.common.schema


import java.io.{File, FileInputStream, InputStream}
import java.util.UUID

import edu.cdl.iot.common.schema.FieldClassification.FeatureClassification
import org.yaml.snakeyaml.Yaml

import scala.beans.BeanProperty
import collection.JavaConverters._

class SchemaYaml(@BeanProperty var name: String,
                 @BeanProperty var projectGuid: UUID,
                 @BeanProperty var fields: java.util.List[FieldYaml],
                 @BeanProperty var importOptions: ImportOptionsYaml) extends Serializable {
  def this() {
    this(null, null, List().asJava, null)
  }
}

case class Schema(yaml: SchemaYaml) {

  val name: String = yaml.name
  val projectGuid: UUID = yaml.projectGuid
  val fields: List[Field] = yaml.fields.asScala.toList.map(Field)
  val importOptions: ImportOptions = ImportOptions(yaml.importOptions)

  def toYaml: String = (new Yaml).dump(yaml)

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

  def getFeatures(row: Array[String]): Map[String, String] =
    getClassifications(fields.zipWithIndex, FieldClassification.Feature)
      .map(tuple => (tuple._1.name.toLowerCase, row(tuple._2)))
      .toMap

  def getLabels(row: Array[String]): Map[String, String] =
    getClassifications(fields.zipWithIndex, FieldClassification.Label)
      .map(tuple => (tuple._1.name.toLowerCase, row(tuple._2)))
      .toMap

  // TODO We will want to create actual type checks for this
  def validate(row: Array[String]): Boolean = fields.length == row.length
}


object SchemaFactory {
  def parse(input: String): Schema = {
    val yaml = new Yaml
    Schema(yaml.loadAs(input, classOf[SchemaYaml]))
  }

  def parse(input: InputStream): Schema = {
    val yaml = new Yaml
    Schema(yaml.loadAs(input, classOf[SchemaYaml]))
  }

  def getSchema(name: String): Schema = {
    val schemaFile = s"${System.getProperty("user.dir")}/db/data/schema/${name}.yaml"
    SchemaFactory.parse(new FileInputStream(new File(schemaFile)))
  }
}