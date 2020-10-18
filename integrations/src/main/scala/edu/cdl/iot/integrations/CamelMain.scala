package edu.cdl.iot.integrations

import edu.cdl.iot.integrations.dao.{GrafanaDao, PredictionDao, SchemaDao}
import edu.cdl.iot.integrations.factories.ProcessorFactory
import edu.cdl.iot.integrations.routes.{GrafanaRoutes, PredictionRoutes}
import edu.cdl.iot.common.factories.ConfigFactory
import org.apache.camel.Exchange
import org.apache.camel.component.kafka.{KafkaComponent, KafkaConfiguration}
import org.apache.camel.component.netty.http.NettyHttpComponent
import org.apache.camel.impl.DefaultCamelContext
import org.apache.camel.spi.{CamelLogger, LogListener}

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
    val schemaProcessors = processorFactory.getSchemaProcessors(schemaDataDao)

    val context = new DefaultCamelContext

    val kafkaComponent = new KafkaComponent()
    val kafkaConfig = new KafkaConfiguration
    kafkaConfig.setSerializerClass("org.apache.kafka.common.serialization.ByteArraySerializer")
    kafkaConfig.setValueDeserializer("org.apache.kafka.common.serialization.ByteArrayDeserializer")
    kafkaConfig.setKeyDeserializer("org.apache.kafka.common.serialization.ByteArrayDeserializer")
    kafkaComponent.setConfiguration(kafkaConfig)

    context.addComponent("netty-http", new NettyHttpComponent)
    context.addComponent("kafka", kafkaComponent)
    context.addRoutes(new PredictionRoutes(context, config.getKafkaConfig(), schemaProcessors, predictionProcessors))
    context.addRoutes(new GrafanaRoutes(context, schemaProcessors, grafanaProcessors))
    context.addLogListener(new LogListener {
      override def onLog(exchange: Exchange, camelLogger: CamelLogger, message: String): String = {
        println(s"Camel Log: ${message}")
        message
      }
    })
    context.start()
  }
}

