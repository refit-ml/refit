package edu.cdl.iot.integrations.grafana.core.repository

trait GrafanaOrganizationRepository {
  def getOrganizations: List[String]

}
