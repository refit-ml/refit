package edu.cdl.iot.camel

import edu.cdl.iot.camel.dao.CassandraDao
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
    val dao = new CassandraDao(config.getCassandraConfig())
    val cassandraProcessors = processorFactory.getCassandraProcessors(dao)
    val grafanaProcessors = processorFactory.getGrafanaProcessors(dao)
    val pulsarProcessors = processorFactory.getPulsarProcessors
    val schemaProcessors = processorFactory.getSchemaProcessors(dao)

    val context = new DefaultCamelContext
    context.addComponent("netty-http", new NettyHttpComponent)
    context.addRoutes(new PredictionRoutes(context, pulsarProcessors, schemaProcessors, cassandraProcessors))
    context.addRoutes(new GrafanaRoutes(context, schemaProcessors, cassandraProcessors, grafanaProcessors))
    context.start()
  }
}

