package edu.cdl.iot.ingestion.routes

import edu.cdl.iot.ingestion.transform.SenosrDataProcessors
import org.apache.camel.CamelContext
import org.apache.camel.builder.RouteBuilder

class SensorDataRoutes(val context: CamelContext) extends RouteBuilder(context) {
  private val PROCESS_INTERVAL = 5000

  override def configure(): Unit = {
    from(s"timer://sensor-data?period=$PROCESS_INTERVAL")
      .process(SenosrDataProcessors.schemaProcessor)
      .process(SenosrDataProcessors.sensorDataProducer)
      .process(SenosrDataProcessors.sendToPulsar)
  }
}
