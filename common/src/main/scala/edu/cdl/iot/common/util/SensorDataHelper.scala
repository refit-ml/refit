package edu.cdl.iot.common.util

import java.util.UUID

import edu.cdl.iot.common.schema.{Field, Schema}
import edu.cdl.iot.common.schema.enums.{FieldClassification, FieldType}
import edu.cdl.iot.protocol.SensorData.SensorData
import org.joda.time.{DateTime, DateTimeZone}

object SensorDataHelper {

  private val featureP = (field: Field) => field.classification == FieldClassification.Feature || field.classification == FieldClassification.Label
  private val doubleP = (field: Field) => field.`type` == FieldType.Double
  private val stringP = (field: Field) => field.`type` == FieldType.String
  private val intP = (field: Field) => field.`type` == FieldType.Integer
  private val r = new scala.util.Random

  def randomDouble(start: Double = 0.0, end: Double = 1.0): Double = (r.nextDouble() * (end - start)) + start

  def randomInt(): Int = r.nextInt()

  def getRandomReadings(schema: Schema, sensorId: String = UUID.randomUUID().toString, includeLabels: Boolean = false): SensorData = {
    val features = schema.fields.filter(field =>
      field.classification == FieldClassification.Feature)

    val labels = schema.fields.filter(field =>
      field.classification == FieldClassification.Label)

    val doubles = features.filter(doubleP)
      .map(field => field.name.toLowerCase() -> (field.name.toLowerCase() match {
        case "temperature" => randomDouble(0.0, 100.0)
        case "pressure" => randomDouble(1000, 1500)
        case "wind" => randomDouble(0, 50)
        case _ => randomDouble()
      }))
      .toMap

    val strings = features.filter(stringP)
      .map(field => field.name.toLowerCase() -> UUID.randomUUID().toString)
      .toMap
    val ints = features.filter(stringP)
      .map(field => field.name.toLowerCase() -> randomInt())
      .toMap


    val actual = if (schema.name == "Dummy") labels.map(x => x.name.toLowerCase() -> (if (doubles("temperature") > 75.0) 0 else 1).toString)
      .toMap
    else labels.filter(x => includeLabels).map(x => x.name.toLowerCase() -> randomDouble().toString).toMap

    new SensorData(
      schema.projectGuid.toString,
      sensorId,
      DateTime.now.toDateTime(DateTimeZone.UTC).toString("yyyy-MM-dd HH:mm:ss"),
      doubles,
      strings,
      ints,
      actual
    )
  }
}
