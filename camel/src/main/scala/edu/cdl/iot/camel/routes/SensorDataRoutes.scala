package edu.cdl.iot.camel.routes

import edu.cdl.iot.camel.transform.{ProtobufProcessors, PulsarProcessors}
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange, Processor}


class SensorDataRoutes(val context: CamelContext) extends RouteBuilder(context) {
  val PULSAR_PROCESS_INTERVAL_MILLS = 100
  val ENCRYPTION_KEY = "keyboard_cat"
  // This is just to print everything out for testing,
  // ideally we will have all processors in the ./transform folder

  private val logger = new Processor {
    override def process(exchange: Exchange): Unit = {
      val predictionData = exchange.getIn().getBody(classOf[Prediction])
      val encrypted = EncryptionHelper.encrypt(ENCRYPTION_KEY, predictionData.projectGuid)
      println(s"Message Received\n\tProject: ${predictionData.projectGuid}\n\tEncrypted GUID: $encrypted\n\tSensorID: ${predictionData.sensorId}\n\tDoubles: ${predictionData.doubles}\n\tStrings: ${predictionData.strings}\n\tIntegers: ${predictionData.integers}\n\tPredictions: ${predictionData.prediction} ")
    }
  }


  override def configure(): Unit = {
    from(s"timer://pulsar?period=$PULSAR_PROCESS_INTERVAL_MILLS")
      .process(PulsarProcessors.produceMessages)
      .process(ProtobufProcessors.Predictions.deserialize)
      .process(logger)
      .process(PulsarProcessors.ack)
  }
}
