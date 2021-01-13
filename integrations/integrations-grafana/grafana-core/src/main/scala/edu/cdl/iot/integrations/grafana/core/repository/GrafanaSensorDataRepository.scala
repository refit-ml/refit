package edu.cdl.iot.integrations.grafana.core.repository

trait GrafanaSensorDataRepository {
  def find(projectGuid: String,
                    sensorId: String,
                    partitions: List[String]): List[Map[String, String]]
}
