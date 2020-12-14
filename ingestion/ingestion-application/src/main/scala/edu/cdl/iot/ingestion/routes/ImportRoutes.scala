package edu.cdl.iot.ingestion.routes

import edu.cdl.iot.common.yaml.KafkaConfig
import edu.cdl.iot.ingestion.constants.HttpConstants
import edu.cdl.iot.ingestion.core.dto.request.{ImportRequest, ModelRequest, SchemaRequest}
import edu.cdl.iot.ingestion.core.dto.response.ImportResponse
import edu.cdl.iot.ingestion.core.service.{ImportService, ModelService, ProjectService}
import edu.cdl.iot.protocol.ImportRequest.{ImportRequest => ImportEnvelope}
import org.apache.camel.{CamelContext, Exchange}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestBindingMode

class ImportRoutes(private val kafkaConfig: KafkaConfig,
                   private val importService: ImportService,
                   private val modelService: ModelService,
                   private val projectService: ProjectService,
                   private val context: CamelContext) extends RouteBuilder(context) {
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
      .process((exchange: Exchange) => {
        val request = exchange.getIn.getBody(classOf[ImportRequest])
        importService.saveImportRequest(request)
        exchange.getIn.setBody(new ImportResponse(true))
      })

    rest()
      .post("/models")
      .`type`(classOf[ModelRequest])
      .outType(classOf[ImportResponse])
      .route()
      .process((exchange: Exchange) => {
        val request = exchange.getIn.getBody(classOf[ModelRequest])
        modelService.updateModel(request)
        new ImportResponse(requestSuccessful = true)
      })


    rest()
      .post("/project")
      .`type`(classOf[SchemaRequest])
      .outType(classOf[ImportResponse])
      .route()
      .process((exchange: Exchange) => {
        val body = exchange.getIn.getBody(classOf[SchemaRequest])
        projectService.createProject(body)
        new ImportResponse(requestSuccessful = true)
      })

    from(s"kafka:${kafkaConfig.topics.`import`}?brokers=${kafkaConfig.host}")
      .process((exchange: Exchange) => {
        val body = exchange.getIn.getBody(classOf[Array[Byte]])
        val envelope = ImportEnvelope.parseFrom(body)
        val request = ImportRequest.of(envelope)
        importService.performSensorDataImport(request)
      })


  }
}
