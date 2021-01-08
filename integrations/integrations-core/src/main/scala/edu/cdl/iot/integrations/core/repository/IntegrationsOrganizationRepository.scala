package edu.cdl.iot.integrations.core.repository

trait IntegrationsOrganizationRepository {
  def getOrganizations: List[String]

}
