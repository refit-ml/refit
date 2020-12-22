package edu.cdl.iot.ingestion.routes

import edu.cdl.iot.common.yaml.KafkaConfig
import edu.cdl.iot.ingestion.constants.{HttpConstants, PulsarConstants}
import edu.cdl.iot.ingestion.dto.request.{ImportRequest, ModelRequest, SchemaRequest}
import edu.cdl.iot.ingestion.dto.response.ImportResponse
import edu.cdl.iot.ingestion.transform.{ImportProcessors, ModelProcessors, SchemaProcessors}
import org.apache.camel.CamelContext
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestBindingMode

class HttpRoutes(val context: CamelContext,
                 val kafkaConfig: KafkaConfig,
                 val importProcessors: ImportProcessors,
                 val modelProcessors: ModelProcessors,
                 val schemaProcessors: SchemaProcessors) extends RouteBuilder(context) {

  override def configure(): Unit = {
    restConfiguration.component("netty-http")
      .enableCORS(true)
      .corsHeaderProperty("Access-Control-Allow-Origin", "*")
      .corsHeaderProperty("Access-Control-Allow-Methods", "POST")
      .corsHeaderProperty("Access-Control-Allow-Headers", "accept, content-type")
      .port(HttpConstants.PORT)
      .bindingMode(RestBindingMode.json)

    rest()
      .post("/import")
      .`type`(classOf[ImportRequest])
      .outType(classOf[ImportResponse])
      .route()
      .process(importProcessors.publishImportRequest)

    rest()
      .post("/models")
      .`type`(classOf[ModelRequest])
      .outType(classOf[ImportResponse])
      .route()
      .process(modelProcessors.modelProcessor)

    rest()
      .post("/project")
      .`type`(classOf[SchemaRequest])
      .outType(classOf[ImportResponse])
      .route()
      .process(schemaProcessors.createSchema)

    from(s"kafka:${kafkaConfig.topics.`import`}?brokers=${kafkaConfig.host}")
      .process(importProcessors.deseralizeImportRequest)
      .process(importProcessors.doImport)


  }
}
