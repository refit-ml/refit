package edu.cdl.iot.integrations.grafana.core.service

import edu.cdl.iot.integrations.grafana.core.repository.{GrafanaOrganizationRepository, GrafanaProjectRepository, GrafanaSensorRepository}
import edu.cdl.iot.integrations.grafana.core.request.TagRequest
import edu.cdl.iot.integrations.grafana.core.response.TagResponse

class GrafanaTagService(sensorRepository: GrafanaSensorRepository,
                        projectRepository: GrafanaProjectRepository,
                        organizationRepository: GrafanaOrganizationRepository) {

  def getTagKeys: Array[String] =
    Array("sensor", "project")

  def getTagValues(request: TagRequest): Array[TagResponse] =
    request.key match {
      case "sensor" => sensorRepository
        .findAll
        .map(x => new TagResponse(x))
        .toArray
      case "project" => projectRepository.find
        .map(x => new TagResponse(s"${x.name} - ${x.projectGuid}"))
        .toArray
      case "org" => organizationRepository.findAll
        .map(x => new TagResponse(x))
        .toArray
      case _ => organizationRepository.findAll
        .map(x => new TagResponse(x))
        .toArray
    }
}
