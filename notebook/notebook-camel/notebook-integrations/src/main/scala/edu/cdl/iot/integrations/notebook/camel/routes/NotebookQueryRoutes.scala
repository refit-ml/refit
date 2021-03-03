package edu.cdl.iot.integrations.notebook.camel.routes

import java.net.URLDecoder
import java.util.UUID

import edu.cdl.iot.common.domain.TrainingWindow
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.integrations.notebook.core.service.NotebookQueryService
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestParamType
import org.apache.camel.{CamelContext, Exchange, Message}
import org.slf4j.LoggerFactory

import scala.collection.JavaConverters.mapAsJavaMapConverter

class NotebookQueryRoutes(private val context: CamelContext,
                          private val queryService: NotebookQueryService) extends RouteBuilder(context) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookQueryRoutes])

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
        val response = queryService.query(projectGuid, from, to, sensors)
          .map(x => x.asJava)
          .toArray

        message.setBody(response)
        logger.info("Sensor Data Fetched")
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
        val response = queryService.trainingWindow(projectGuid, from, to, sensors).toArray

        message.setBody(response)
        logger.info("Training-window fetched")
      })


  }
}
