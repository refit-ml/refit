package edu.cdl.iot.camel

import edu.cdl.iot.camel.routes.{GrafanaRoutes, SensorDataRoutes}
import org.apache.camel.component.servlet.ServletComponent
import org.apache.camel.impl.DefaultCamelContext

object CamelMain {
  def main(args: Array[String]) {
    val context = new DefaultCamelContext
    val sc = new ServletComponent()
    context.addComponent("servlet", sc)

    context.addRoutes(new SensorDataRoutes(context))
//    context.addRoutes(new GrafanaRoutes(context))

    context.start()
  }
}

