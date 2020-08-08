package edu.cdl.iot.camel.routes

import edu.cdl.iot.camel.transform.{ProtobufProcessors, PulsarProcessors}
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.camel.{CamelContext, Exchange}
import org.apache.camel.scala.dsl.builder.ScalaRouteBuilder


class SensorDataRoutes(override val context: CamelContext) extends ScalaRouteBuilder(context) {
  val PULSAR_PROCESS_INTERVAL_MILLS = 100
  val ENCRYPTION_KEY = "keyboard_cat"
  // This is just to print everything out for testing,
  // ideally we will have all processors in the ./transform folder
  val myProcessorRecieveMethod: Exchange => Unit = (exchange: Exchange) => {
    val sensorData = exchange.getIn().getBody(classOf[SensorData])
    val encrypted = EncryptionHelper.encrypt(ENCRYPTION_KEY, sensorData.projectGuid)
    println(s"Message Received\n\tProject: ${sensorData.projectGuid}\n\tEncrypred GUID: $encrypted\n\tSensorID: ${sensorData.sensorId}\n\tDoubles: ${sensorData.doubles}\n\tStrings: ${sensorData.strings}\n\tIntegers: ${sensorData.integers}")
  }

  from(s"timer://pulsar?period=$PULSAR_PROCESS_INTERVAL_MILLS") ==> {
    process(PulsarProcessors.produceMessages)
    process(ProtobufProcessors.Sensors.deserialize)
    process(myProcessorRecieveMethod)
    process(PulsarProcessors.ack)
  }
}
