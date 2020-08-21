package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dto.QueryRequest
import org.apache.camel.{Exchange, Processor}

object GrafanaProcessors {
  val queryProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn().getBody(classOf[QueryRequest])

    }
  }
}
