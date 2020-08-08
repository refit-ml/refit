package edu.cdl.iot.camel.transform

import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.camel.Exchange

object ProtobufProcessors {

  object Sensors {
    def deserialize: Exchange => Unit = (exchange: Exchange) => {
      val body = exchange.getIn().getBody(classOf[Array[Byte]])
      val sensorData = SensorData.parseFrom(body)
      exchange.getIn.setBody(sensorData)
    }
  }

}
