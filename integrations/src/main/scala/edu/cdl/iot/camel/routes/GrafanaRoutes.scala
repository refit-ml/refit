package edu.cdl.iot.camel.routes


import edu.cdl.iot.camel.dto.request.{QueryRequest, SearchRequest, TagRequest}
import edu.cdl.iot.camel.dto.response.{AnnotationFixtures, AnnotationResponse, TableFixtures, TimeSerieFixtures}
import edu.cdl.iot.camel.dto.HealthCheckDto
import edu.cdl.iot.camel.transform.{GrafanaProcessors, SchemaProcessors}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange, Processor}
import org.apache.camel.model.rest.RestBindingMode


class GrafanaRoutes(private val context: CamelContext,
                    private val schemaProcessors: SchemaProcessors,
                    private val grafanaProcessors: GrafanaProcessors) extends RouteBuilder(context) {
  private val port = 3000
  private val ANNOTATION_ROUTE_ID = "direct:grafana-annotations"
  private val HEALTH_CHECK_ROUTE_ID = "direct:healthcheck"
  private val SEARCH_ROUTE_ID = "direct:grafana-search"
  private val SCHEMA_HEADER = "REFIT_SCHEMA"

  val projectGuid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"

  val postProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn().getBody(classOf[QueryRequest])

      val res = body.targets.map(x => {
        if (x.`type` == "timeserie") TimeSerieFixtures.response(x.target) else TableFixtures.response
      })
      exchange.getIn.setBody(res)
    }
  }

  override def configure(): Unit = {

    restConfiguration.component("netty-http")
      .enableCORS(true)
      .corsHeaderProperty("Access-Control-Allow-Origin", "*")
      .corsHeaderProperty("Access-Control-Allow-Methods", "POST")
      .corsHeaderProperty("Access-Control-Allow-Headers", "accept, content-type")
      .port(port)
      .bindingMode(RestBindingMode.json)

    rest("/query")
      .post()
      .consumes("application/json")
      .`type`(classOf[QueryRequest])
      .outType(classOf[Array[_]])
      .route()
      .process(schemaProcessors.extractOrg)
      .process(schemaProcessors.extractSchema)
      .process(schemaProcessors.getQueryPartitions)
      .process(grafanaProcessors.grafanaQuery)
      .process(grafanaProcessors.queryProcessor)


    rest("/annotations")
      .post()
      .outType(classOf[Array[AnnotationResponse]])
      .to(ANNOTATION_ROUTE_ID)

    rest("/search")
      .post()
      .`type`(classOf[SearchRequest])
      .outType(classOf[Array[String]])
      .route()
      .to(SEARCH_ROUTE_ID)

    rest("/tag-keys")
      .post()
      .route()
      .outputType(classOf[Array[String]])
      .transform()
      .constant(Array("sensor", "project"))

    rest("/tag-values")
      .post()
      .consumes("application/json")
      .`type`(classOf[TagRequest])
      .outType(classOf[Array[_]])
      .route()
      .setHeader(SCHEMA_HEADER, constant(projectGuid))
      .process(grafanaProcessors.tagProcessor)

    rest()
      // Health check
      .get("/")
      .outType(classOf[HealthCheckDto])
      .to(HEALTH_CHECK_ROUTE_ID)


    from(HEALTH_CHECK_ROUTE_ID)
      .transform
      .constant(new HealthCheckDto)

    from(ANNOTATION_ROUTE_ID)
      .transform
      .constant(AnnotationFixtures.response)

    from(SEARCH_ROUTE_ID)
      .setHeader(SCHEMA_HEADER, constant(projectGuid))
      .process(grafanaProcessors.searchProcessor)


  }
}


