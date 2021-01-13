package edu.cdl.iot.integrations.prediction.core.repository

import java.sql.Timestamp

trait PredictionSensorDataRepository {
  def save(partition: String,
                     timestamp: Timestamp,
                     projectGuid: String,
                     sensorId: String,
                     data: Map[String, String],
                     predictions: Map[String, String],
                     labels: Map[String, String]): Unit
}
