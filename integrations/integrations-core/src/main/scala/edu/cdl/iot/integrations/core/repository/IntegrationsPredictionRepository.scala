package edu.cdl.iot.integrations.core.repository

import java.sql.Timestamp

trait IntegrationsPredictionRepository {
  def savePrediction(partition: String,
                     timestamp: Timestamp,
                     projectGuid: String,
                     sensorId: String,
                     data: Map[String, String],
                     predictions: Map[String, String],
                     labels: Map[String, String]): Unit
}
