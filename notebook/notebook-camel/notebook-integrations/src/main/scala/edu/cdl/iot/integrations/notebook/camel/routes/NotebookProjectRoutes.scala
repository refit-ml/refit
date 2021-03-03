package edu.cdl.iot.integrations.notebook.camel.routes

import java.util.UUID

import edu.cdl.iot.common.domain.Project
import edu.cdl.iot.integrations.notebook.core.entity.SchemaImport
import edu.cdl.iot.integrations.notebook.core.service.NotebookProjectService
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestParamType
import org.apache.camel.{CamelContext, Exchange}
import org.slf4j.LoggerFactory


class NotebookProjectRoutes(private val context: CamelContext,
                            private val projectService: NotebookProjectService) extends RouteBuilder(context) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookProjectRoutes])

  override def configure(): Unit = {

    rest("/notebook/project")
      .get("/{projectGuid}")
      .outType(classOf[Project])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .route
      .process((exchange: Exchange) => {
        val message = exchange.getIn
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        val project = projectService.project(projectGuid)
        message.setBody(project)
        logger.info("Project fetched")
      })

    rest("/notebook/project")
      .post()
      .`type`(classOf[SchemaImport])
      .outType(classOf[Project])
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val body = message.getBody(classOf[SchemaImport])
        projectService.createProject(body)
        logger.info("Project created/updated")
      })


  }
}
