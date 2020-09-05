package edu.cdl.iot.camel.transform

import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.{Exchange, Processor}

object ProtobufProcessors {
    object Predictions {
      val deserialize: Processor = new Processor {
        override def process(exchange: Exchange): Unit = {
          val body = exchange.getIn().getBody(classOf[Array[Byte]])
          val sensorData = Prediction.parseFrom(body)
          exchange.getIn.setBody(sensorData)
        }
      }
  }
}
