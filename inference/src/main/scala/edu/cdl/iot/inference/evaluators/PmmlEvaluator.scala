package edu.cdl.iot.inference.evaluators

import java.io.ByteArrayInputStream

import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.dmg.pmml.FieldName
import org.jpmml.evaluator._
import scala.collection.JavaConverters.{mapAsJavaMapConverter, mapAsScalaMapConverter}


class PmmlEvaluator(private val model: Model) extends IRefitEvaluator {

  private val pmmlEvaluator: ModelEvaluator[_] = new LoadingModelEvaluatorBuilder()
    .load(new ByteArrayInputStream(model.bytes.toByteArray))
    .build()


  private val getPmmlVector: (SensorData) => Map[FieldName, FieldValue] =
    (v: SensorData) => v.doubles.map({
      case (x, d) =>
        FieldName.create(x) -> FieldValueUtil.create(d)
    }).++(v.integers.map({
      case (x, d) =>
        FieldName.create(x) -> FieldValueUtil.create(d)
    })).++(v.strings.map({
      case (x, d) =>
        FieldName.create(x) -> FieldValueUtil.create(d)
    }))


  private val getPmmlPrediction: SensorData => Map[String, String] =
    (v: SensorData) => EvaluatorUtil.decodeAll(pmmlEvaluator.evaluate(getPmmlVector(v).asJava))
      .asScala
      .map(
        { case (x, d) =>
          x -> d.toString
        }).toMap

  def getPrediction(sensorData: SensorData): Prediction =
    new Prediction(sensorData.projectGuid,
      sensorData.sensorId,
      sensorData.timestamp,
      model.key,
      sensorData.doubles,
      sensorData.strings,
      sensorData.integers,
      getPmmlPrediction(sensorData),
      sensorData.labels
    )

  def toByteArray: Array[Byte] = model.toByteArray

  override def close: Any = {

  }
}