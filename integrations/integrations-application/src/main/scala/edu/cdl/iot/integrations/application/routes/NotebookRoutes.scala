package edu.cdl.iot.integrations.application.routes

import edu.cdl.iot.integrations.core.request.NotebookQuery
import edu.cdl.iot.integrations.core.service.NotebookQueryService
import org.apache.camel.{CamelContext, Exchange}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestParamType
import org.joda.time.DateTime

import scala.collection.JavaConverters.mapAsJavaMapConverter

class NotebookRoutes(private val context: CamelContext,
                     private val notebookQueryService: NotebookQueryService) extends RouteBuilder(context) {
  override def configure(): Unit = {

    rest("/notebook")
      .get("/sensor-data")
      .`type`(classOf[NotebookQuery])
      .outType(classOf[Array[_]])
      .param.name("projectGuid").`type`(RestParamType.query).required(true).endParam()
      .param.name("from").`type`(RestParamType.query).required(true).endParam()
      .param.name("to").`type`(RestParamType.query).required(true).endParam()
      .param.name("sensors").`type`(RestParamType.query).required(false).endParam()
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val projectGuid = message.getHeader("projectGuid", classOf[String])
        val from = DateTime.parse(message.getHeader("from", classOf[String]))
        val to = DateTime.parse(message.getHeader("to", classOf[String]))
        val sensors = message.getHeader("sensors", classOf[String]).split(",").toList
        val response = notebookQueryService.query(projectGuid, from, to, sensors)
          .map(x => x.asJava)
          .toArray

        message.setBody(response)
      })
  }

}
