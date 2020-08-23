package edu.cdl.iot.camel.routes


import edu.cdl.iot.camel.transform.{CassandraProcessors, ProtobufProcessors, PulsarProcessors, SchemaProcessors}
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange, Processor}

import scala.collection.mutable


class PredictionRoutes(val context: CamelContext) extends RouteBuilder(context) {
  val PULSAR_PROCESS_INTERVAL_MILLS = 10
  val ENCRYPTION_KEY = "keyboard_cat"
  // This is just to print everything out for testing,
  // ideally we will have all processors in the ./transform folder

  private val logger: Processor = new Processor {
    // Example of how to use the encryption helpers properly
    val encryptionHelpers: mutable.HashMap[String, EncryptionHelper] = new mutable.HashMap[String, EncryptionHelper]()

    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn().getBody(classOf[Prediction])
      val helper = encryptionHelpers.getOrElseUpdate(record.projectGuid, {
        // This is slow, so we delay evaluation and only compute once when we need it
        new EncryptionHelper(ENCRYPTION_KEY, record.projectGuid)
      })

      val encrypted = helper.transform(record.projectGuid)
      println(s"Message Received\n\tProject: ${record.projectGuid}\n\tEncrypted GUID: $encrypted\n\tSensorID: ${record.sensorId}\n\tDoubles: ${record.doubles}\n\tStrings: ${record.strings}\n\tIntegers: ${record.integers}\n\tPredictions: ${record.prediction} ")
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
