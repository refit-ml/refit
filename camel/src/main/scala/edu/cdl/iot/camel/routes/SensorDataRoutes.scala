package edu.cdl.iot.camel.routes

import edu.cdl.iot.camel.transform.{ProtobufProcessors, PulsarProcessors}
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange, Processor}


class SensorDataRoutes(val context: CamelContext) extends RouteBuilder(context) {
  val PULSAR_PROCESS_INTERVAL_MILLS = 100
  val ENCRYPTION_KEY = "keyboard_cat"
  // This is just to print everything out for testing,
  // ideally we will have all processors in the ./transform folder

  private val logger = new Processor {
    override def process(exchange: Exchange): Unit = {
      val sensorData = exchange.getIn().getBody(classOf[SensorData])
      val encrypted = EncryptionHelper.encrypt(ENCRYPTION_KEY, sensorData.sensorId)
      println(s"Message Received\n\tProject: ${sensorData.projectGuid}\n\tEncrypred GUID: $encrypted\n\tSensorID: ${sensorData.sensorId}\n\tDoubles: ${sensorData.doubles}\n\tStrings: ${sensorData.strings}\n\tIntegers: ${sensorData.integers}")

    }
  }


  override def configure(): Unit = {
    from(s"timer://pulsar?period=$PULSAR_PROCESS_INTERVAL_MILLS")
      .process(PulsarProcessors.produceMessages)
      .process(ProtobufProcessors.Sensors.deserialize)
      .process(logger)
      .process(PulsarProcessors.ack)
  }
}
