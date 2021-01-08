package edu.cdl.iot.integrations.application.routes

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.integrations.application.IntegrationConstants
import edu.cdl.iot.integrations.application.IntegrationConstants.SCHEMA_HEADER
import edu.cdl.iot.integrations.core.dto.{GrafanaSensorDataDto, HealthCheckDto}
import edu.cdl.iot.integrations.core.dto.request.{QueryRequest, SearchRequest, TagRequest}
import edu.cdl.iot.integrations.core.dto.response.AnnotationResponse
import edu.cdl.iot.integrations.core.service.{GrafanaAnnotationService, GrafanaQueryService, GrafanaSearchService, GrafanaTagService}
import org.apache.camel.{CamelContext, Exchange}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestBindingMode

class GrafanaRoutes(private val context: CamelContext,
                    private val grafanaAnnotationService: GrafanaAnnotationService,
                    private val grafanaQueryService: GrafanaQueryService,
                    private val grafanaTagService: GrafanaTagService,
                    private val grafanaSearchService: GrafanaSearchService) extends RouteBuilder(context) {
  val projectGuid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"

  override def configure(): Unit = {

    restConfiguration.component("netty-http")
      .enableCORS(true)
      .corsHeaderProperty("Access-Control-Allow-Origin", "*")
      .corsHeaderProperty("Access-Control-Allow-Methods", "POST")
      .corsHeaderProperty("Access-Control-Allow-Headers", "accept, content-type")
      .port(IntegrationConstants.PORT)
      .bindingMode(RestBindingMode.json)

    rest("/query")
      .post()
      .consumes("application/json")
      .`type`(classOf[QueryRequest])
      .outType(classOf[Array[_]])
      .route()
      .process((exchange: Exchange) => {
        val request = exchange.getIn.getBody(classOf[QueryRequest])
        val schema = grafanaQueryService.getSchema(request)
        exchange.getIn().setHeader(IntegrationConstants.SCHEMA_HEADER, schema)
      })
      .process((exchange: Exchange) => {
        val request = exchange.getIn.getBody(classOf[QueryRequest])
        val schema = exchange.getIn().getHeader(IntegrationConstants.SCHEMA_HEADER, classOf[Schema])
        val queryPartitions = grafanaQueryService.getQueryPartitions(request, schema)
        exchange.getIn().setHeader(IntegrationConstants.QUERY_PARTITION_HEADER, queryPartitions)
      })
      .process((exchange: Exchange) => {
        val request = exchange.getIn.getBody(classOf[QueryRequest])
        val schema = exchange.getIn().getHeader(IntegrationConstants.SCHEMA_HEADER, classOf[Schema])
        val partitions = exchange.getIn().getHeader(IntegrationConstants.QUERY_PARTITION_HEADER, classOf[List[String]])
        val queryData = grafanaQueryService.getQueryData(request, schema, partitions)
        exchange.getIn().setBody(queryData)
      })
      .process((exchange: Exchange) => {
        val queryData = exchange.getIn().getBody(classOf[List[GrafanaSensorDataDto]])
        val response = queryData.flatMap(x => grafanaQueryService.query(x))
        exchange.getIn().setBody(response.toArray)
      })


    rest("/annotations")
      .post()
      .outType(classOf[Array[AnnotationResponse]])
      .route()
      .process((exchange: Exchange) => {
        exchange.getIn().setBody(grafanaAnnotationService.getAnnotations)
      })

    rest("/search")
      .post()
      .`type`(classOf[SearchRequest])
      .outType(classOf[Array[String]])
      .route()
      .setHeader(SCHEMA_HEADER, constant(projectGuid))
      .process((exchange: Exchange) => {
        val request = exchange.getIn().getBody(classOf[SearchRequest])
        val response = grafanaSearchService.search(request)
        exchange.getIn().setBody(response)
      })

    rest("/tag-keys")
      .post()
      .route()
      .outputType(classOf[Array[String]])
      .process((exchange: Exchange) => {
        exchange.getIn().setBody(grafanaTagService.getTagKeys)
      })

    rest("/tag-values")
      .post()
      .consumes("application/json")
      .`type`(classOf[TagRequest])
      .outType(classOf[Array[_]])
      .route()
      .setHeader(SCHEMA_HEADER, constant(projectGuid))
      .process((exchange: Exchange) => {
        val request = exchange.getIn().getBody(classOf[TagRequest])
        val response = grafanaTagService.getTagValues(request)
        exchange.getIn().setBody(response)
      })

    rest()
      // Health check
      .get("/")
      .outType(classOf[HealthCheckDto])
      .route()
      .transform()
      .constant(new HealthCheckDto)
  }
}
