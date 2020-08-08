package edu.cdl.iot.camel

import edu.cdl.iot.camel.routes.SensorDataRoutes
import org.apache.camel.main.Main

object CamelMain {
  def main(args: Array[String]) {
    val main = new Main()
    val context = main.getOrCreateCamelContext()

    main.addRouteBuilder(new SensorDataRoutes(context).builder)
    main.run()
  }
}

