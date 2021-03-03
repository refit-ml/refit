package edu.cdl.iot.integrations.notebook.camel.routes

import java.util.UUID

import edu.cdl.iot.integrations.notebook.core.entity.Import
import edu.cdl.iot.integrations.notebook.core.service.NotebookImportService
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestParamType
import org.apache.camel.{CamelContext, Exchange}
import org.slf4j.LoggerFactory

class NotebookImportRoutes(private val context: CamelContext,
                           private val importService: NotebookImportService) extends RouteBuilder(context) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookImportRoutes])

  override def configure(): Unit = {

    rest("/notebook/project")
      .put("/{projectGuid}/import")
      .`type`(classOf[Import])
      .outType(classOf[String])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        logger.info("Import request received")
        val request = exchange.getIn.getBody(classOf[Import])
        importService.saveImportRequest(projectGuid, request)
        logger.info("Import Request Queued")
        message.setBody("Import queued")
      })


    rest("/notebook/project")
      .put("/{projectGuid}/import/training-window")
      .`type`(classOf[Import])
      .outType(classOf[String])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        logger.info("Import request received")
        val request = exchange.getIn.getBody(classOf[Import])
        importService.saveTrainingWindowImportRequest(projectGuid, request)
        logger.info("Import Request Queued")
        message.setBody("Import queued")
      })


    rest("/notebook/project")
      .put("/{projectGuid}/import/{dataSet}")
      .`type`(classOf[Import])
      .outType(classOf[String])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .param.name("dataSet").`type`(RestParamType.path).required(true).endParam()
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        val dataSet = message.getHeader("dataSet", classOf[String])
        logger.info("Static Data Import Request received")
        val request = exchange.getIn.getBody(classOf[Import])
        importService.saveStaticDataImportRequest(projectGuid, dataSet, request)
        logger.info("Static Data Import Request Queued")
        message.setBody("Static Data Import Queued")
      })


  }
}
