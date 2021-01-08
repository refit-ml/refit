package edu.cdl.iot.inference.core.evaluator

import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData

trait RefitEvaluator {
  def getPrediction(sensorData: SensorData): Prediction

  def toByteArray: Array[Byte]

  def close: Any
}
