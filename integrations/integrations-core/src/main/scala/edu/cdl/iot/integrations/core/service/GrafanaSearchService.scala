package edu.cdl.iot.integrations.core.service

import edu.cdl.iot.common.schema.Field
import edu.cdl.iot.common.schema.enums.FieldClassification
import edu.cdl.iot.integrations.core.dto.request.SearchRequest
import edu.cdl.iot.integrations.core.repository.{IntegrationsProjectRepository, IntegrationsSensorRepository}

class GrafanaSearchService(projectRepository: IntegrationsProjectRepository,
                           sensorRepository: IntegrationsSensorRepository) {

  val fieldMapper: Field => List[String] =
    field =>
      if (field.classification == FieldClassification.Label)
        List(s"Actual - ${field.name}", s"Prediction - ${field.name}")
      else
        List(field.name)

  def search(request: SearchRequest): Array[String] =
    request.target match {
      case "sensors" => sensorRepository.getAllSensors.toArray
      case _ => projectRepository.getSchemas.flatMap(schema => schema.fields.flatMap(fieldMapper)).toArray
    }
}
