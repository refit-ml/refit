package edu.cdl.iot.inference.application.transform

import java.time.Instant
import java.util.Date

import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.flink.api.common.functions.MapFunction
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat

import scala.collection.JavaConverters.mapAsJavaMapConverter

class SensorDataMapper extends MapFunction[Prediction, org.apache.flink.api.java.tuple.Tuple6[String, String, String, Date, java.util.Map[String, String], java.util.Map[String, String]]] {
  override def map(v: Prediction): org.apache.flink.api.java.tuple.Tuple6[String, String, String, Date, java.util.Map[String, String], java.util.Map[String, String]] = {
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
    val timestamp =DateTime.parse(v.timestamp, DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss"))

    val d = Date.from(Instant.ofEpochMilli(timestamp.getMillis))
    val partition = timestamp.toString("yyyy-MM-dd")
    new org.apache.flink.api.java.tuple.Tuple6(
      v.projectGuid,
      v.sensorId,
      partition,
      d,
      data.asJava,
      v.prediction.asJava)
  }
}
