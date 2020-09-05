package edu.cdl.iot.inference.evaluators

import java.util.Collections

import ai.onnxruntime.{OnnxTensor, OrtEnvironment, OrtSession}
import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData

import scala.collection.JavaConversions._

object OnnxEvaluator {
  val env: OrtEnvironment = OrtEnvironment.getEnvironment()
}

class OnnxEvaluator(private val model: Model) extends IRefitEvaluator {


  private val onnxEvaluator: OrtSession = OnnxEvaluator.env.createSession(model.bytes.toByteArray, new OrtSession.SessionOptions)


  private def getOnnxMap(v: SensorData): Map[String, Float] =
    v.doubles.map({
      case (x, d) =>
        x -> d.toFloat
    }).++(v.integers.map({
      case (x, d) =>
        x -> d.toFloat
    })).++(v.strings.map({
      case (x, d) =>
        x -> d.toFloat
    })).++(v.labels.map({
      case (x, d) =>
        x -> d.toFloat
    }))

  private def mapEntryToScalar(x: Map[String, Float]): Array[Float] =
    x.toList.map(tuple => tuple._2).toArray

  private def getOnnxVector(v: SensorData): Array[Array[Array[Float]]] =
    Array.fill(1) {
      Array.fill(1) {
        mapEntryToScalar(getOnnxMap(v))
      }
    }

  private def getOnnxTensor(v: SensorData) = OnnxTensor.createTensor(OnnxEvaluator.env, getOnnxVector(v))

  private def getOnnxPrediction(v: SensorData) =
    onnxEvaluator.run(Collections.singletonMap("lstm_1_input", getOnnxTensor(v)))
      .iterator().toList.map(x => x.getKey -> x.getValue
      .asInstanceOf[OnnxTensor]
      .getFloatBuffer
      .array
      .toList
      .map(x => x.toString)
      .head
    ).toMap

  def getPrediction(sensorData: SensorData): Prediction =
    new Prediction(sensorData.projectGuid,
      sensorData.sensorId,
      sensorData.timestamp,
      model.key,
      sensorData.doubles,
      sensorData.strings,
      sensorData.integers,
      getOnnxPrediction(sensorData)
    )

  def toByteArray: Array[Byte] = model.toByteArray

  override def close: Any = {
    onnxEvaluator.close()
    OnnxEvaluator.env.close()
  }
}
