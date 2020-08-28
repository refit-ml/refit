package edu.cdl.iot.inference.util

import java.io.ByteArrayInputStream
import java.util.Collections

import ai.onnxruntime.{OnnxTensor, OrtEnvironment, OrtSession}
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.dmg.pmml.FieldName
import org.jpmml.evaluator.{EvaluatorUtil, FieldValue, FieldValueUtil, LoadingModelEvaluatorBuilder, ModelEvaluator}

import scala.collection.JavaConversions._
import scala.collection.JavaConverters.{mapAsJavaMapConverter, mapAsScalaMapConverter, _}


class RefitEvaluator(private val model: Model) {
  def this(bytes: Array[Byte]) = this(Model.parseFrom(bytes))

  private var onnxEnv: OrtEnvironment = _
  private var onnxEvaluator: OrtSession = _
  private var pmmlEvaluator: ModelEvaluator[_] = _

  if (model.format == SerializationFormat.ONNX) {
    onnxEnv = OrtEnvironment.getEnvironment()
    onnxEvaluator = onnxEnv.createSession(model.bytes.toByteArray, new OrtSession.SessionOptions)
  }

  else {
    pmmlEvaluator = new LoadingModelEvaluatorBuilder()
      .load(new ByteArrayInputStream(model.bytes.toByteArray))
      .build()
  }

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

  private val getOnnxMap: (SensorData) => Map[String, Any] =
    (v: SensorData) => v.doubles.map({
      case (x, d) =>
        x -> d
    }).++(v.integers.map({
      case (x, d) =>
        x -> d
    })).++(v.strings.map({
      case (x, d) =>
        x -> d
    }))

  private val mapEntryToScalar: Map[String, Any] => Array[Any] =
    (x: Map[String, Any]) => x.toList.map((tuple) => tuple._2).toArray

  private val getOnnxVector: SensorData => Array[Array[Array[Any]]] =
    (v: SensorData) => Array.fill(1) {
      Array.fill(1) {
        mapEntryToScalar(getOnnxMap(v))
      }
    }

  private val getOnnxTensor: SensorData => OnnxTensor =
    (v: SensorData) => OnnxTensor.createTensor(onnxEnv, getOnnxVector(v))

  private val getOnnxPrediction: SensorData => Map[String, String] =
    (v: SensorData) => onnxEvaluator.run(Collections.singletonMap("lstm_1_input", getOnnxTensor(v)))
      .iterator().toList.map(x => x.getKey -> x.getValue
      .asInstanceOf[OnnxTensor]
      .getFloatBuffer
      .array
      .toList
      .map(x => x.toString)
      .head
    ).toMap

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
      model.format match {
        case SerializationFormat.ONNX => getOnnxPrediction(sensorData)
        case SerializationFormat.PMML => getPmmlPrediction(sensorData)
        case _ => getOnnxPrediction(sensorData)
      }
    )

  def toByteArray: Array[Byte] = model.bytes.toByteArray
}
