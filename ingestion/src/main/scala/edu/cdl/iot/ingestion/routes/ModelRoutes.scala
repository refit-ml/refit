package edu.cdl.iot.ingestion.routes

import edu.cdl.iot.ingestion.transform.{ModelProcessors, PulsarProcessors}
import org.apache.camel.CamelContext
import org.apache.camel.builder.RouteBuilder

class ModelRoutes(private val modelProcessors: ModelProcessors,
                  private val pulsarProcessors: PulsarProcessors,
                  private val context: CamelContext) extends RouteBuilder(context) {
  private val PROCESS_INTERVAL = 60000


  override def configure(): Unit = {
    from(s"timer://pulsar?period=$PROCESS_INTERVAL")
      .process(modelProcessors.getProjects)
      .process(modelProcessors.getModels)
      .process(pulsarProcessors.sendModels)
  }
}
