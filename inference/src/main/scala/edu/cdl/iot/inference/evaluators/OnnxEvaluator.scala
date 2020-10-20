package edu.cdl.iot.inference.evaluators

import java.util.Collections

import ai.onnxruntime.TensorInfo.OnnxTensorType
import ai.onnxruntime.{OnnxSequence, OnnxTensor, OrtEnvironment, OrtSession}
import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData

import scala.collection.JavaConversions._

object OnnxEvaluator {
  val env: OrtEnvironment = OrtEnvironment.getEnvironment()
}

class OnnxEvaluator(private val model: Model) extends IRefitEvaluator {


  private val onnxEvaluator: OrtSession = OnnxEvaluator.env.createSession(model.bytes.toByteArray, new OrtSession.SessionOptions)


  def getOnnxMap(v: SensorData): Map[String, Float] =
    v.doubles.keys.toList.sorted.map(
      k => k -> v.doubles(k).toFloat
    ).toMap
      .++(v.integers.keys.toList.sorted.map(
        k => k -> v.doubles(k).toFloat
      ).toMap)
      .++(v.strings.keys.toList.sorted.map(
        k => k -> v.doubles(k).toFloat
      ).toMap)

  def mapEntryToScalar(x: Map[String, Float]): Array[Float] =
    x.toList.map(tuple => tuple._2).toArray

  private def getOnnxVector(v: SensorData): Array[Array[Float]] =
    Array.fill(1) {
      mapEntryToScalar(getOnnxMap(v))
    }

  private def getOnnxTensor(v: SensorData) = OnnxTensor.createTensor(OnnxEvaluator.env, getOnnxVector(v))

  private def getOnnxPrediction(v: SensorData) = {
    val tensor = getOnnxTensor(v)
    val i = Collections.singletonMap("input", tensor)
    onnxEvaluator
      .run(i)
      .iterator()
      .toList
      .map(x => x.getKey -> x.getValue)
      .flatMap(entry => {
        val c = entry._2.getClass.toString
        val sequenceClass = classOf[OnnxSequence].toString

        val result = if (sequenceClass == c) entry._2.asInstanceOf[OnnxSequence].getValue.map(x => x.toString).toArray
        else {
          val output = entry._2.asInstanceOf[OnnxTensor]
          val outputType = output.getInfo.onnxType

          val buffer = outputType match {
            case OnnxTensorType.ONNX_TENSOR_ELEMENT_DATA_TYPE_INT8 => output.getIntBuffer.array
            case OnnxTensorType.ONNX_TENSOR_ELEMENT_DATA_TYPE_INT16 => output.getIntBuffer.array
            case OnnxTensorType.ONNX_TENSOR_ELEMENT_DATA_TYPE_INT32 => output.getIntBuffer.array
            case OnnxTensorType.ONNX_TENSOR_ELEMENT_DATA_TYPE_INT64 => output.getLongBuffer.array
            case OnnxTensorType.ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT => output.getFloatBuffer.array
            case OnnxTensorType.ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT16 => output.getFloatBuffer.array
            case OnnxTensorType.ONNX_TENSOR_ELEMENT_DATA_TYPE_BFLOAT16 => output.getFloatBuffer.array
            case OnnxTensorType.ONNX_TENSOR_ELEMENT_DATA_TYPE_DOUBLE => output.getDoubleBuffer.array
            case _ => output.getFloatBuffer.array
          }
          buffer.map(x => x.toString)
        }

        result.map(x => entry._1 -> x)
      })
      .toMap


  }

  def getPrediction(sensorData: SensorData): Prediction =
    new Prediction(sensorData.projectGuid,
      sensorData.sensorId,
      sensorData.timestamp,
      model.key,
      sensorData.doubles,
      sensorData.strings,
      sensorData.integers,
      getOnnxPrediction(sensorData),
      sensorData.labels
    )

  def toByteArray: Array[Byte] = model.toByteArray

  override def close: Any = {
    onnxEvaluator.close()
    OnnxEvaluator.env.close()
  }
}
