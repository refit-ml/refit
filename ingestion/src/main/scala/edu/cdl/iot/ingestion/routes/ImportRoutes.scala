package edu.cdl.iot.ingestion.routes

import edu.cdl.iot.ingestion.constants.PulsarConstants
import edu.cdl.iot.ingestion.dao.ImportDao
import edu.cdl.iot.ingestion.dto.request.ImportRequest
import edu.cdl.iot.ingestion.dto.response.ImportResponse
import edu.cdl.iot.ingestion.transform.ImportProcessors
import org.apache.camel.CamelContext
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestBindingMode

class ImportRoutes(val context: CamelContext,
                   val importProcessors: ImportProcessors) extends RouteBuilder(context) {
  private val port = 3001

  override def configure(): Unit = {
    restConfiguration.component("netty-http")
      .enableCORS(true)
      .corsHeaderProperty("Access-Control-Allow-Origin", "*")
      .corsHeaderProperty("Access-Control-Allow-Methods", "POST")
      .corsHeaderProperty("Access-Control-Allow-Headers", "accept, content-type")
      .port(port)
      .bindingMode(RestBindingMode.json)

    rest()
      .post("/import")
      .`type`(classOf[ImportRequest])
      .outType(classOf[ImportResponse])
      .route()
      .process(importProcessors.publishImportRequest)

    from(s"timer://sensor-data?period=${PulsarConstants.POLL_INTERVAL_MILLS}")
      .process(importProcessors.consumeImportRequests)
      .process(importProcessors.deseralizeImportRequest)
      .process(importProcessors.ackImportRequest)
      .process(importProcessors.doImport)
  }
}
