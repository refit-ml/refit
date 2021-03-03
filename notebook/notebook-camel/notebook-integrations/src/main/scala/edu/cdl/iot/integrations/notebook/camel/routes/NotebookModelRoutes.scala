package edu.cdl.iot.integrations.notebook.camel.routes

import java.util.UUID

import edu.cdl.iot.common.domain.Project
import edu.cdl.iot.integrations.notebook.core.entity.Model
import edu.cdl.iot.integrations.notebook.core.service.{NotebookModelService, NotebookQueryService}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestParamType
import org.apache.camel.{CamelContext, Exchange}
import org.slf4j.LoggerFactory


class NotebookModelRoutes(private val context: CamelContext,
                          private val modelService: NotebookModelService) extends RouteBuilder(context) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookModelRoutes])

  override def configure(): Unit = {

    rest("/notebook/project")
      .put("/{projectGuid}/model")
      .`type`(classOf[Model])
      .outType(classOf[Project])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        val request = exchange.getIn.getBody(classOf[Model])
        modelService.updateModel(projectGuid, request)
        logger.info("Model published")
      })
  }
}
