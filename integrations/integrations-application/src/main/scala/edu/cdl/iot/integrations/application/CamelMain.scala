package edu.cdl.iot.integrations.application

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.integrations.application.dependencies.IntegrationsDependencies
import org.apache.camel.component.kafka.{KafkaComponent, KafkaConfiguration}
import org.apache.camel.component.netty.http.NettyHttpComponent
import org.apache.camel.impl.DefaultCamelContext

object CamelMain {
  def main(args: Array[String]) {
    val configFactory = new ConfigFactory()
    val config = configFactory.getConfig

    val context = new DefaultCamelContext

    val dependencies = new IntegrationsDependencies(config, context)

    val kafkaComponent = new KafkaComponent()
    val kafkaConfig = new KafkaConfiguration


    kafkaConfig.setSerializerClass("org.apache.kafka.common.serialization.ByteArraySerializer")
    kafkaConfig.setKeySerializerClass("org.apache.kafka.common.serialization.ByteArraySerializer")
    kafkaConfig.setValueDeserializer("org.apache.kafka.common.serialization.ByteArrayDeserializer")
    kafkaConfig.setKeyDeserializer("org.apache.kafka.common.serialization.ByteArrayDeserializer")
    kafkaComponent.setConfiguration(kafkaConfig)

    context.addComponent("netty-http", new NettyHttpComponent)
    context.addComponent("kafka", kafkaComponent)
    context.addRoutes(dependencies.grafanaRoutes)
    context.addRoutes(dependencies.predictionRoutes)
    context.addRoutes(dependencies.notebookRoutes)
    context.addRoutes(dependencies.schedulerDependencies.timedRoutesBuilder)

    context.start()

  }
}
