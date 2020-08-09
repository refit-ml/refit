package edu.cdl.iot.camel

import edu.cdl.iot.camel.routes.SensorDataRoutes
import org.apache.camel.impl.DefaultCamelContext

object CamelMain {
  def main(args: Array[String]) {
    val context = new DefaultCamelContext
    context.addRoutes(new SensorDataRoutes(context))

    context.start()
  }
}

