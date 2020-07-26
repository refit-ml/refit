package com.cdl.iot.transform

import cdl.iot.dto.Prediction.Prediction
import cdl.iot.dto.SensorData.SensorData
import org.apache.flink.api.common.functions.MapFunction

import collection.JavaConverters.mapAsJavaMapConverter

class SensorDataMapper extends MapFunction[Prediction, org.apache.flink.api.java.tuple.Tuple5[String, String, String, java.util.Map[String, String], java.util.Map[String, String]]] {
  override def map(v: Prediction): org.apache.flink.api.java.tuple.Tuple5[String, String, String, java.util.Map[String, String], java.util.Map[String, String]] = {
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
    new org.apache.flink.api.java.tuple.Tuple5(
      s"${v.timestamp}_${v.sensorId}",
      v.sensorId.toString,
      v.timestamp,
      data.asJava,
      v.prediction.asJava)
  }
}
