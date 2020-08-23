package edu.cdl.iot.camel.routes


import edu.cdl.iot.camel.dto.request.{QueryRequest, SearchRequest, TagRequest}
import edu.cdl.iot.camel.dto.response.{AnnotationFixtures, AnnotationResponse, TableFixtures, TimeSerieFixtures}
import edu.cdl.iot.camel.dto.HealthCheckDto
import edu.cdl.iot.camel.transform.{CassandraProcessors, GrafanaProcessors, SchemaProcessors}
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.schema.factories.SchemaFactory
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange, Processor}
import org.apache.camel.model.rest.RestBindingMode


class GrafanaRoutes(val context: CamelContext) extends RouteBuilder(context) {
  private val port = 3000
  private val ANNOTATION_ROUTE_ID = "direct:grafana-annotations"
  private val HEALTH_CHECK_ROUTE_ID = "direct:healthcheck"
  private val SEARCH_ROUTE_ID = "direct:grafana-search"
  private val QUERY_ROUTE_ID = "direct:grafana-query"
  private val SCHEMA_HEADER = "REFIT_SCHEMA"

  val schema: Schema = SchemaFactory.getSchema("dummy")

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
    /* This is to get us started
     * When you start up camel, this will create a web server to receive requests
     * the example I made here puts a health check endpoint at
     * http://localhost:3000/meta/ping
     */

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
      .process(SchemaProcessors.extractOrg)
      .process(SchemaProcessors.extractSchema)
      .process(SchemaProcessors.getQueryPartitions)
      .process(CassandraProcessors.grafanaQuery)
      .process(GrafanaProcessors.queryProcessor)


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
      .setHeader(SCHEMA_HEADER, constant(schema))
      .process(GrafanaProcessors.tagProcessor)

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
      .setHeader(SCHEMA_HEADER, constant(schema))
      .process(GrafanaProcessors.searchProcessor)


  }
}


