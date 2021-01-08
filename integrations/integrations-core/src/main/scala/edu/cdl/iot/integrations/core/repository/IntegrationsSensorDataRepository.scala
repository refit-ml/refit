package edu.cdl.iot.integrations.core.repository

trait IntegrationsSensorDataRepository {
  def getSensorData(projectGuid: String,
                    sensorId: String,
                    partitions: List[String]): List[Map[String, String]]
}
