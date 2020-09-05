package edu.cdl.iot.training.load

import java.util.UUID
import org.apache.spark.sql.{DataFrame, Encoders, SparkSession}

object SensorData {
  def load(session: SparkSession): DataFrame = {

    session
      .read
      .format("org.apache.spark.sql.cassandra")
      .options(Map("table" -> "sensor_data", "keyspace" -> "cdl_refit"))
      .load()
      .select("sensor_id", "timestamp", "data", "prediction")
      .map(d => {
        val sensorId = d(0).toString
        val timestamp = d(1).toString
        val map = d(2).asInstanceOf[Map[String, String]]
        (
          UUID.randomUUID().toString,
          sensorId,
          timestamp,
          map("temperature").toDouble,
          map("pressure").toDouble,
          map("wind").toDouble
        )

      })(Encoders.product[(String, String, String, Double, Double, Double)])
      .toDF(Seq("guid", "sensor_id", "timestamp", "temperature", "pressure", "wind"): _ *)
  }
}
