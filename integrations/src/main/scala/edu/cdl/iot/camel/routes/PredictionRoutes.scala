package edu.cdl.iot.camel.routes


import edu.cdl.iot.camel.transform.{PredictionProcessors, ProtobufProcessors, PulsarProcessors, SchemaProcessors}
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange, Processor}


class PredictionRoutes(private val context: CamelContext,
                       private val pulsarProcessors: PulsarProcessors,
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
    from(s"timer://pulsar?period=$PULSAR_PROCESS_INTERVAL_MILLS")
      .process(pulsarProcessors.produceMessages)
      .process(ProtobufProcessors.Predictions.deserialize)
      .process(schemaProcessors.extractSchemaFromProto)
      .process(logger)
      .process(predictionProcessors.sendToCassandra)
      .process(pulsarProcessors.ack)
  }
}
