package edu.cdl.iot.integrations.core.service

import edu.cdl.iot.integrations.core.dto.request.TagRequest
import edu.cdl.iot.integrations.core.dto.response.TagResponse
import edu.cdl.iot.integrations.core.repository.{IntegrationsOrganizationRepository, IntegrationsProjectRepository, IntegrationsSensorRepository}

class GrafanaTagService(sensorRepository: IntegrationsSensorRepository,
                        projectRepository: IntegrationsProjectRepository,
                        organizationRepository: IntegrationsOrganizationRepository) {

  def getTagKeys: Array[String] =
    Array("sensor", "project")

  def getTagValues(request: TagRequest): Array[TagResponse] =
    request.key match {
      case "sensor" => sensorRepository
        .getAllSensors
        .map(x => new TagResponse(x))
        .toArray
      case "project" => projectRepository.getProjects
        .map(x => new TagResponse(x))
        .toArray
      case "org" => organizationRepository.getOrganizations
        .map(x => new TagResponse(x))
        .toArray
      case _ => organizationRepository.getOrganizations
        .map(x => new TagResponse(x))
        .toArray
    }
}
