package edu.cdl.iot.common.util

import java.util.UUID

import edu.cdl.iot.common.schema.{Field, Schema}
import edu.cdl.iot.common.schema.enums.{FieldClassification, FieldType}
import edu.cdl.iot.protocol.SensorData.SensorData

import scala.util.Random

object SensorDataHelper {

  private val featureP = (field: Field) => field.classification == FieldClassification.Feature || field.classification == FieldClassification.Label
  private val doubleP = (field: Field) => field.`type` == FieldType.Double
  private val stringP = (field: Field) => field.`type` == FieldType.String
  private val intP = (field: Field) => field.`type` == FieldType.Integer
  private val r = new scala.util.Random

  def randomDouble(): Double = r.nextDouble()

  def randomInt(): Int = r.nextInt()

  def getRandomReadings(schema: Schema): SensorData = {
    val features = schema.fields.filter(featureP)

    val doubles = features.filter(doubleP)
      .map(field => field.name.toLowerCase() -> randomDouble())
      .toMap
    val strings = features.filter(stringP)
      .map(field => field.name.toLowerCase() -> UUID.randomUUID().toString)
      .toMap
    val ints = features.filter(stringP)
      .map(field => field.name.toLowerCase() -> randomInt())
      .toMap

    new SensorData(
      schema.projectGuid.toString,
      UUID.randomUUID().toString,
      "",
      doubles,
      strings,
      ints
    )
  }
}
