package edu.cdl.iot.ingestion

import edu.cdl.iot.ingestion.routes.{ModelRoutes, SensorDataRoutes}
import org.apache.camel.component.netty.http.NettyHttpComponent
import org.apache.camel.impl.DefaultCamelContext

object CamelMain {
  def main(args: Array[String]) {
    val context = new DefaultCamelContext
    context.addComponent("netty-http", new NettyHttpComponent)
    context.addRoutes(new ModelRoutes(context))
    context.addRoutes(new SensorDataRoutes(context))
    context.start()
  }
}

