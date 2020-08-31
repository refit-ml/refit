package edu.cdl.iot.ingestion.routes

import edu.cdl.iot.ingestion.transform.{ModelProcessors, PulsarProcessors}
import org.apache.camel.CamelContext
import org.apache.camel.builder.RouteBuilder

class ModelRoutes(val context: CamelContext) extends RouteBuilder(context) {
  private val PROCESS_INTERVAL = 60000

  override def configure(): Unit = {
    from(s"timer://pulsar?period=$PROCESS_INTERVAL")
      .process(ModelProcessors.getProjects)
      .process(ModelProcessors.getModels)
      .process(PulsarProcessors.sendModels)

  }
}
