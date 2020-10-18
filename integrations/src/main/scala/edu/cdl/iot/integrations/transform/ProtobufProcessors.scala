package edu.cdl.iot.integrations.transform

import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.{Exchange, Processor}
import org.slf4j.LoggerFactory

object ProtobufProcessors {
    object Predictions {
      private val logger = LoggerFactory.getLogger(this.getClass)
      val deserialize: Processor = new Processor {
        override def process(exchange: Exchange): Unit = {
          logger.info("Deserialize prediction")
          val body = exchange.getIn().getBody(classOf[Array[Byte]])
          val sensorData = Prediction.parseFrom(body)
          exchange.getIn.setBody(sensorData)
        }
      }
  }
}
