package edu.cdl.iot.common.util

import edu.cdl.iot.protocol.Prediction.Prediction

object PredictionHelper {
  def combineSensorReadings(v: Prediction): Map[String, String] = {
    val data: Map[String, String] = v.integers.map({
      case (x, d) =>
        x -> d.toString
    })
      .++(v.doubles.map({
        case (x, d) =>
          x -> d.toString
      }))
      .++(v.strings.map({
        case (x, d) =>
          x -> d
      }))
    data
  }

}
