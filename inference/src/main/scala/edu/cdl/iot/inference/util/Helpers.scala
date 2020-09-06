package edu.cdl.iot.inference.util

import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.java.utils.ParameterTool
import org.dmg.pmml.FieldName
import org.jpmml.evaluator.{FieldValue, FieldValueUtil}

object Helpers {
  def env_var(name: String, defaultValue: String, params: ParameterTool): String =
    if (sys.env.contains("LOCAL"))
      if (sys.env.contains(name)) sys.env(name)
      else defaultValue
    else params.get(name, defaultValue)

  val emptyPrediction: SensorData => Prediction =
    (value: SensorData) => new Prediction(
      value.projectGuid,
      value.sensorId,
      value.timestamp,
      "__none__",
      value.doubles,
      value.strings,
      value.integers,
      Map.empty[String, String]
    )

}
