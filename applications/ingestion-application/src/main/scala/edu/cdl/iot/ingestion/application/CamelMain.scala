package edu.cdl.iot.ingestion.application

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.ingestion.application.dependencies.IngestionDependencies
import org.apache.camel.component.kafka.{KafkaComponent, KafkaConfiguration}
import org.apache.camel.component.netty.http.NettyHttpComponent
import org.apache.camel.component.quartz.QuartzComponent
import org.apache.camel.impl.DefaultCamelContext

object CamelMain {
  def main(args: Array[String]) {
    val configFactory = new ConfigFactory()
    val config = configFactory.getConfig

    val context = new DefaultCamelContext


    val dependencies = new IngestionDependencies(config, context)

    val kafkaComponent = new KafkaComponent()
    val kafkaConfig = new KafkaConfiguration

    kafkaConfig.setSerializerClass("org.apache.kafka.common.serialization.ByteArraySerializer")
    kafkaConfig.setKeySerializerClass("org.apache.kafka.common.serialization.ByteArraySerializer")
    kafkaConfig.setValueDeserializer("org.apache.kafka.common.serialization.ByteArrayDeserializer")
    kafkaConfig.setKeyDeserializer("org.apache.kafka.common.serialization.ByteArrayDeserializer")
    kafkaComponent.setConfiguration(kafkaConfig)


    val quartzComponent = new QuartzComponent(context)
    quartzComponent.setProperties(dependencies.schedulerDependencies.properties)

    context.addComponent("kafka", kafkaComponent)
    context.addComponent("quartz", quartzComponent)

    context.addRoutes(dependencies.notebookDependencies.importRoutes)
    context.addRoutes(dependencies.schedulerDependencies.routes)


    context.start()

  }
}
