package edu.cdl.iot.inference.evaluators

import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData

trait IRefitEvaluator {
  def getPrediction(sensorData: SensorData): Prediction

  def toByteArray: Array[Byte]

  def close: Any
}
