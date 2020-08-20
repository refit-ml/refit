package edu.cdl.iot.camel
import edu.cdl.iot.camel.routes.{GrafanaRoutes, PredictionRoutes}
import org.apache.camel.component.netty.http.NettyHttpComponent
import org.apache.camel.impl.DefaultCamelContext

object CamelMain {
  def main(args: Array[String]) {
    val context = new DefaultCamelContext
    context.addComponent("netty-http", new NettyHttpComponent)
    //context.addRoutes(new PredictionRoutes(context))
    context.addRoutes(new GrafanaRoutes(context))
    context.start()
  }
}

