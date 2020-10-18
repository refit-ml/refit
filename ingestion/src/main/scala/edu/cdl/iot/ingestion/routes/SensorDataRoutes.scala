package edu.cdl.iot.ingestion.routes

import edu.cdl.iot.common.yaml.KafkaConfig
import edu.cdl.iot.ingestion.transform.SenosrDataProcessors
import org.apache.camel.{CamelContext, Exchange, Expression}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.component.kafka.KafkaConstants

class SensorDataRoutes(private val kafkaConfig: KafkaConfig,
                        private val senosrDataProcessors: SenosrDataProcessors,
                       private val context: CamelContext) extends RouteBuilder(context) {
  private val PROCESS_INTERVAL = 5000

  override def configure(): Unit = {
    from(s"timer://sensor-data?period=$PROCESS_INTERVAL")
      .process(senosrDataProcessors.schemaProcessor)
      .process(senosrDataProcessors.sensorDataProducer)
      .process(senosrDataProcessors.serialize)
      .to(s"kafka:${kafkaConfig.topics.data}?brokers=${kafkaConfig.host}")
  }
}
