package edu.cdl.iot.camel.routes

import edu.cdl.iot.camel.dto.HealthCheckDto
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.CamelContext
import org.apache.camel.model.rest.RestBindingMode

class GrafanaRoutes(val context: CamelContext) extends RouteBuilder(context) {
  private val port = 3000

  override def configure(): Unit = {
    /* This is to get us started
     * When you start up camel, this will create a web server to receive requests
     * the example I made here puts a health check endpoint at
     * http://localhost:3000/meta/ping
     */

    restConfiguration.component("netty-http")
      .port(port)
      .bindingMode(RestBindingMode.json)

    rest("/meta")
      .get("/ping")
      .outType(classOf[HealthCheckDto])
      .to("direct:ping")

    from("direct:ping")
      .transform
      .constant(new HealthCheckDto)
  }
}


