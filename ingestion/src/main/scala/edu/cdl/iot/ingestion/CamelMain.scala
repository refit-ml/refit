package edu.cdl.iot.ingestion

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.ingestion.factories.ProcessorFactory
import edu.cdl.iot.ingestion.routes.SensorDataRoutes
import org.apache.camel.component.kafka.{KafkaComponent, KafkaConfiguration}
import org.apache.camel.component.netty.http.NettyHttpComponent
import org.apache.camel.impl.DefaultCamelContext
import org.slf4j.LoggerFactory

object CamelMain {

  def main(args: Array[String]) {
    val configFactory = new ConfigFactory()
    val config = configFactory.getConfig

    val processorFactory = new ProcessorFactory(config)
    val modelDao = processorFactory.getModelDao
    val importDao = processorFactory.getImportDao
    val modelProcessors = processorFactory.getModelProcessors(modelDao)
    val sensorDataProcessors = processorFactory.getSensorDataProcessors(modelDao)
    //    val importProcessors = processorFactory.getImportProcessors(importDao)
    val schemaProcessors = processorFactory.getSchemaProcessors(importDao)

    val context = new DefaultCamelContext

    val kafkaComponent = new KafkaComponent()
    val kafkaConfig = new KafkaConfiguration
    kafkaConfig.setSerializerClass("org.apache.kafka.common.serialization.ByteArraySerializer")
    kafkaComponent.setConfiguration(kafkaConfig)

    context.addComponent("netty-http", new NettyHttpComponent)
    context.addComponent("kafka", kafkaComponent)

    if (config.runDemo()) {
      context.addRoutes(new SensorDataRoutes(config.getKafkaConfig(), sensorDataProcessors, context))
    }
    else {
      //      context.addRoutes(new HttpRoutes(context, importProcessors, modelProcessors, schemaProcessors))
    }
    context.start()
  }
}

