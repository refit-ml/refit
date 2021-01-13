package edu.cdl.iot.integrations.grafana.core.repository

trait GrafanaOrganizationRepository {
  def findAll: List[String]

}
