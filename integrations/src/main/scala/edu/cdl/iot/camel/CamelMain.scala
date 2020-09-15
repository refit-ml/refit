package edu.cdl.iot.camel

import edu.cdl.iot.camel.dao.{GrafanaDao, PredictionDao, SchemaDao}
import edu.cdl.iot.camel.factories.ProcessorFactory
import edu.cdl.iot.camel.routes.{GrafanaRoutes, PredictionRoutes}
import edu.cdl.iot.common.factories.ConfigFactory
import org.apache.camel.component.netty.http.NettyHttpComponent
import org.apache.camel.impl.DefaultCamelContext

object CamelMain {
  def main(args: Array[String]) {
    val configFactory = new ConfigFactory()
    val config = configFactory.getConfig

    val processorFactory = new ProcessorFactory(config)
    val grafanaDao = new GrafanaDao(config.getCassandraConfig())
    val predictionDao = new PredictionDao(config.getCassandraConfig())
    val schemaDataDao = new SchemaDao(config.getCassandraConfig())

    val predictionProcessors = processorFactory.getPredictionProcessors(predictionDao)
    val grafanaProcessors = processorFactory.getGrafanaProcessors(schemaDataDao, grafanaDao)
    val pulsarProcessors = processorFactory.getPulsarProcessors
    val schemaProcessors = processorFactory.getSchemaProcessors(schemaDataDao)

    val context = new DefaultCamelContext
    context.addComponent("netty-http", new NettyHttpComponent)
    //context.addRoutes(new PredictionRoutes(context, pulsarProcessors, schemaProcessors, predictionProcessors))
    context.addRoutes(new GrafanaRoutes(context, schemaProcessors, grafanaProcessors))
    context.start()
  }
}

