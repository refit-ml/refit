package edu.cdl.iot.integrations.notebook.camel.routes

import java.net.URLDecoder
import java.util.UUID

import edu.cdl.iot.common.domain.{Project, TrainingWindow}
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.integrations.notebook.core.entity.request.{ImportRequest, SchemaRequest}
import edu.cdl.iot.integrations.notebook.core.entity.response.ImportResponse
import edu.cdl.iot.integrations.notebook.core.service.NotebookIntegrationService
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestParamType
import org.apache.camel.{CamelContext, Exchange, Message}
import org.slf4j.LoggerFactory

import scala.collection.JavaConverters.mapAsJavaMapConverter

class NotebookRoutes(private val context: CamelContext,
                     private val notebookIntegrationService: NotebookIntegrationService) extends RouteBuilder(context) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookRoutes])

  override def configure(): Unit = {

    def getOptionalHeader(message: Message, key: String): List[String] =
      if (message.getHeaders.containsKey(key))
        message.getHeader(key, classOf[String]).split(",").toList
      else List()


    rest("/notebook/project")
      .get("/{projectGuid}/sensor-data")
      .outType(classOf[Array[_]])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .param.name("from").`type`(RestParamType.query).required(true).endParam()
      .param.name("to").`type`(RestParamType.query).required(true).endParam()
      .param.name("sensors").`type`(RestParamType.header).required(false).endParam()
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        val from = TimestampHelper.parseDate(URLDecoder.decode(message.getHeader("from", classOf[String])))
        val to = TimestampHelper.parseDate(URLDecoder.decode(message.getHeader("to", classOf[String])))
        val sensors = getOptionalHeader(message, "sensors")
        val response = notebookIntegrationService.query(projectGuid, from, to, sensors)
          .map(x => x.asJava)
          .toArray

        message.setBody(response)
      })

    rest("/notebook/project")
      .get("/{projectGuid}/training-window")
      .outType(classOf[Array[TrainingWindow]])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .param.name("from").`type`(RestParamType.query).required(true).endParam()
      .param.name("to").`type`(RestParamType.query).required(true).endParam()
      .param.name("sensors").`type`(RestParamType.header).required(false).endParam()
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        val from = TimestampHelper.parseDate(URLDecoder.decode(message.getHeader("from", classOf[String])))
        val to = TimestampHelper.parseDate(URLDecoder.decode(message.getHeader("to", classOf[String])))
        val sensors = getOptionalHeader(message, "sensors")
        val response = notebookIntegrationService.trainingWindow(projectGuid, from, to, sensors).toArray

        message.setBody(response)
      })

    rest("/notebook/project")
      .get("/{projectGuid}")
      .outType(classOf[Project])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .route
      .process((exchange: Exchange) => {
        val message = exchange.getIn
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        val project = notebookIntegrationService.project(projectGuid)
        message.setBody(project)
      })

    rest()
      .post("/project")
      .`type`(classOf[SchemaRequest])
      .outType(classOf[ImportResponse])
      .route()
      .process((exchange: Exchange) => {
        val body = exchange.getIn.getBody(classOf[SchemaRequest])
        notebookIntegrationService.createProject(body)
        new ImportResponse(requestSuccessful = true)
      })

    rest("/notebook/project")
      .put("/{projectGuid}/model/{modelGuid}")
      .outType(classOf[Project])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .param.name("modelGuid").`type`(RestParamType.path).required(true).endParam()
      .route
      .process((exchange: Exchange) => {
        val message = exchange.getIn
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        val modelGuid = UUID.fromString(message.getHeader("modelGuid", classOf[String]))
        val project = notebookIntegrationService.putModel(projectGuid, modelGuid)
        message.setBody(project)
      })


    rest("/notebook/project")
      .put("/{projectGuid}/import")
      .`type`(classOf[ImportRequest])
      .outType(classOf[ImportResponse])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        logger.info("Import request received")
        val request = exchange.getIn.getBody(classOf[ImportRequest])
        notebookIntegrationService.saveImportRequest(projectGuid, request)
        exchange.getIn.setBody(new ImportResponse(true))
        logger.info("Import Request Queued")
      })
  }
}