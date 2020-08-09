package edu.cdl.iot.camel.routes


import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, LoggingLevel}
import org.apache.camel.model.rest.RestBindingMode

class GrafanaRoutes(val context: CamelContext) extends RouteBuilder(context) {
  //  restConfiguration()
  override def configure(): Unit = {
    restConfiguration()
      .component("servlet")
      .host("localhost")
      .bindingMode(RestBindingMode.json)
      .port(3000)

    rest("/hello")
      .get()
      .to("direct:hello")

    from("direct:hello").log(LoggingLevel.INFO, "Hello World").transform.simple("Hello World")
  }
}
