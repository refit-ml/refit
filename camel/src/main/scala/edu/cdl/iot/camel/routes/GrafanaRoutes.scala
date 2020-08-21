package edu.cdl.iot.camel.routes


import edu.cdl.iot.camel.dto.{AnnotationFixtures, AnnotationResponse, HealthCheckDto, QueryRequest, TableFixtures, TimeSerieFixtures}
import edu.cdl.iot.common.schema.{Schema, SchemaFactory}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange, Processor}
import org.apache.camel.model.rest.RestBindingMode


class GrafanaRoutes(val context: CamelContext) extends RouteBuilder(context) {
  private val port = 3000
  private val ANNOTATION_ROUTE_ID = "direct:grafana-annotations"
  private val HEALTH_CHECK_ROUTE_ID = "direct:healthcheck"
  private val SEARCH_ROUTE_ID = "direct:grafana-search"

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
      .process(postProcessor)

    rest("/annotations")
      .post()
      .outType(classOf[Array[AnnotationResponse]])
      .to(ANNOTATION_ROUTE_ID)

    rest("/search")
      .post()
      .outType(classOf[Array[String]])
      .to(SEARCH_ROUTE_ID)

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
      .transform
      .constant((schema.fields.map(i => i.name)).toArray)

  }
}


