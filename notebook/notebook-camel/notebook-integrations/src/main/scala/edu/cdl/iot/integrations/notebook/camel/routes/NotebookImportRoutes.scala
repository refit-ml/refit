package edu.cdl.iot.integrations.notebook.camel.routes

import java.net.URLDecoder
import java.util.UUID

import edu.cdl.iot.common.domain.{Project, TrainingWindow}
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.integrations.notebook.core.entity.{FileImport, Model, SchemaImport}
import edu.cdl.iot.integrations.notebook.core.service.{NotebookImportService, NotebookQueryService}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestParamType
import org.apache.camel.{CamelContext, Exchange, Message}
import org.slf4j.LoggerFactory

import scala.collection.JavaConverters.mapAsJavaMapConverter

class NotebookImportRoutes(private val context: CamelContext,
                           private val importService: NotebookImportService) extends RouteBuilder(context) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookImportRoutes])

  override def configure(): Unit = {

    rest("/notebook/project")
      .put("/{projectGuid}/import")
      .`type`(classOf[FileImport])
      .outType(classOf[String])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        logger.info("Import request received")
        val request = exchange.getIn.getBody(classOf[FileImport])
        importService.saveImportRequest(projectGuid, request)
        logger.info("Import Request Queued")
        message.setBody("Import queued")
      })

  }
}
