package edu.cdl.iot.ingestion.routes

import org.apache.camel.CamelContext
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestBindingMode

class HttpRoutes(val context: CamelContext) extends RouteBuilder(context) {
  private val port = 3000
  private val HEALTH_CHECK_ROUTE_ID = "direct:health-check"
  private val healthCheckResponse = "PONG"

  override def configure(): Unit = {
    restConfiguration.component("netty-http")
      .enableCORS(true)
      .corsHeaderProperty("Access-Control-Allow-Origin", "*")
      .corsHeaderProperty("Access-Control-Allow-Methods", "POST")
      .corsHeaderProperty("Access-Control-Allow-Headers", "accept, content-type")
      .port(port)
      .bindingMode(RestBindingMode.json)

    rest()
      // Health check
      .get("/")
      .outType(classOf[String])
      .to(HEALTH_CHECK_ROUTE_ID)

    from(HEALTH_CHECK_ROUTE_ID)
      .transform
      .constant(healthCheckResponse)
  }
}
