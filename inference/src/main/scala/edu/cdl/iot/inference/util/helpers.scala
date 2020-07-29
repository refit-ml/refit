package edu.cdl.iot.inference.util

import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.java.utils.ParameterTool
import org.dmg.pmml.FieldName
import org.jpmml.evaluator.{FieldValue, FieldValueUtil}

object helpers {
  def env_var(name: String, defaultValue: String, params: ParameterTool): String =
    if (sys.env.contains("LOCAL"))
      if (sys.env.contains(name)) sys.env(name)
      else defaultValue
    else params.get(name, defaultValue)

  def getVector(v: SensorData): Map[FieldName, FieldValue] = {
    val input: Map[FieldName, FieldValue] = v.doubles.map({
      case (x, d) =>
        FieldName.create(x) -> FieldValueUtil.create(d)
    })
      .++(v.integers.map({
        case (x, d) =>
          FieldName.create(x) -> FieldValueUtil.create(d)
      }))
      .++(v.strings.map({
        case (x, d) =>
          FieldName.create(x) -> FieldValueUtil.create(d)
      }))
    input
  }

}
