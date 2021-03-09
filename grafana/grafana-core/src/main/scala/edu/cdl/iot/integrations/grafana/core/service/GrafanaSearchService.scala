package edu.cdl.iot.integrations.grafana.core.service

import edu.cdl.iot.common.domain.Project
import edu.cdl.iot.common.schema.{Field, Schema}
import edu.cdl.iot.common.schema.enums.FieldClassification
import edu.cdl.iot.integrations.grafana.core.repository.{GrafanaProjectRepository, GrafanaSensorRepository}
import edu.cdl.iot.integrations.grafana.core.request.SearchRequest

class GrafanaSearchService(projectRepository: GrafanaProjectRepository,
                           sensorRepository: GrafanaSensorRepository) {

  val fieldMapper: Field => List[String] =
    field =>
      if (field.classification == FieldClassification.Label)
        List(s"Actual - ${field.name}", s"Prediction - ${field.name}")
      else
        List(field.name)

  def fieldExtractor(schema: Schema): List[String] =
    schema.fields.flatMap(fieldMapper) ::: schema.dataSources.flatMap(_.fields.flatMap(fieldMapper))


  def search(request: SearchRequest): Array[String] =
    request.target match {
      case "sensors" => sensorRepository.findAll.toArray
      case _ => projectRepository.find.flatMap(x => fieldExtractor(x.schema)).toArray
    }
}
