package edu.cdl.iot.integrations.routes


import edu.cdl.iot.common.yaml.KafkaConfig
import edu.cdl.iot.integrations.transform.{PredictionProcessors, ProtobufProcessors, SchemaProcessors}
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange, Processor}


class PredictionRoutes(private val context: CamelContext,
                       private val kafkaConfig: KafkaConfig,
                       private val schemaProcessors: SchemaProcessors,
                       private val predictionProcessors: PredictionProcessors) extends RouteBuilder(context) {
  val PULSAR_PROCESS_INTERVAL_MILLS = 10

  private val logger: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn().getBody(classOf[Prediction])
      println(s"Message Received\n\tProject: ${record.projectGuid}\n\tPrediction: ${record.prediction}")
    }
  }

  override def configure(): Unit = {
    from(s"kafka:${kafkaConfig.topics.predictions}?brokers=${kafkaConfig.host}")
      .process(ProtobufProcessors.Predictions.deserialize)
      .process(schemaProcessors.extractSchemaFromProto)
      .process(logger)
      .process(predictionProcessors.sendToCassandra)
  }
}
