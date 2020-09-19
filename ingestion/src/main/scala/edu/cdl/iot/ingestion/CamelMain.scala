package edu.cdl.iot.ingestion

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.ingestion.factories.ProcessorFactory
import edu.cdl.iot.ingestion.routes.{HttpRoutes, ImportRoutes, ModelRoutes, SensorDataRoutes}
import org.apache.camel.component.netty.http.NettyHttpComponent
import org.apache.camel.impl.DefaultCamelContext

object CamelMain {
  def main(args: Array[String]) {
    val configFactory = new ConfigFactory()
    val config = configFactory.getConfig

    val processorFactory = new ProcessorFactory(config)
    val modelDao = processorFactory.getModelDao
    val modelProcessors = processorFactory.getModelProcessors(modelDao)
    val pulsarProcessors = processorFactory.getPulsarProcessors
    val sensorDataProcessors = processorFactory.getSensorDataProcessors(modelDao)
    val importProcessors = processorFactory.getImportProcessors

    val context = new DefaultCamelContext

    context.addComponent("netty-http", new NettyHttpComponent)

    if (config.runDemo()) {
      context.addRoutes(new SensorDataRoutes(sensorDataProcessors, context))
      context.addRoutes(new ModelRoutes(modelProcessors, pulsarProcessors, context))
    }
    context.addRoutes(new HttpRoutes(context))
    context.addRoutes(new ImportRoutes(context, importProcessors))
    context.start()
  }
}

