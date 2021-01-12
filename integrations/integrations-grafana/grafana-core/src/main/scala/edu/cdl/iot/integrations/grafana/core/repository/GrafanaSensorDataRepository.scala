package edu.cdl.iot.integrations.grafana.core.repository

trait GrafanaSensorDataRepository {
  def getSensorData(projectGuid: String,
                    sensorId: String,
                    partitions: List[String]): List[Map[String, String]]
}
