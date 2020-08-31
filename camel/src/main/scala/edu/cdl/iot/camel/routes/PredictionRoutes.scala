package edu.cdl.iot.camel.routes


import edu.cdl.iot.camel.transform.{CassandraProcessors, ProtobufProcessors, PulsarProcessors, SchemaProcessors}
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange, Processor}


class PredictionRoutes(val context: CamelContext) extends RouteBuilder(context) {
  val PULSAR_PROCESS_INTERVAL_MILLS = 10

  private val logger: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn().getBody(classOf[Prediction])
      println(s"Message Received\n\tProject: ${record.projectGuid}\n\tPrediction: ${record.prediction}")
    }
  }

  override def configure(): Unit = {
    from(s"timer://pulsar?period=$PULSAR_PROCESS_INTERVAL_MILLS")
      .process(PulsarProcessors.produceMessages)
      .process(ProtobufProcessors.Predictions.deserialize)
      .process(SchemaProcessors.extractSchemaFromProto)
      .process(logger)
      .process(CassandraProcessors.sendToCassandra)
      .process(PulsarProcessors.ack)
  }
}
