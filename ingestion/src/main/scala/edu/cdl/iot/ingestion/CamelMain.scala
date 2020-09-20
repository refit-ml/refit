package edu.cdl.iot.ingestion

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.ingestion.factories.ProcessorFactory
import edu.cdl.iot.ingestion.routes.{HttpRoutes, SensorDataRoutes}
import org.apache.camel.component.netty.http.NettyHttpComponent
import org.apache.camel.impl.DefaultCamelContext

object CamelMain {
  def main(args: Array[String]) {
    val configFactory = new ConfigFactory()
    val config = configFactory.getConfig

    val processorFactory = new ProcessorFactory(config)
    val modelDao = processorFactory.getModelDao
    val importDao = processorFactory.getImportDao
    val modelProcessors = processorFactory.getModelProcessors(modelDao)
    val pulsarProcessors = processorFactory.getPulsarProcessors
    val sensorDataProcessors = processorFactory.getSensorDataProcessors(modelDao)
    val importProcessors = processorFactory.getImportProcessors(importDao)

    val context = new DefaultCamelContext

    context.addComponent("netty-http", new NettyHttpComponent)

    if (config.runDemo()) {
      context.addRoutes(new SensorDataRoutes(sensorDataProcessors, context))
    }
    context.addRoutes(new HttpRoutes(context, importProcessors, modelProcessors))
    context.start()
  }
}

