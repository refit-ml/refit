package edu.cdl.iot.camel.transform

import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.camel.{Exchange, Processor}

object ProtobufProcessors {

  object Sensors {
    val deserialize: Processor = new Processor {
      override def process(exchange: Exchange): Unit = {
        val body = exchange.getIn().getBody(classOf[Array[Byte]])
        val sensorData = SensorData.parseFrom(body)
        exchange.getIn.setBody(sensorData)
      }
    }
  }

}
