package edu.cdl.iot.ingestion.application.routes

import edu.cdl.iot.common.yaml.KafkaConfig
import edu.cdl.iot.ingestion.application.constants.HttpConstants
import edu.cdl.iot.ingestion.core.service.ImportService
import edu.cdl.iot.protocol.ImportRequest.{ImportRequest => ImportEnvelope}
import org.apache.camel.{CamelContext, Exchange}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestBindingMode
import org.slf4j.LoggerFactory

class ImportRoutes(private val kafkaConfig: KafkaConfig,
                   private val importService: ImportService,
                   private val context: CamelContext) extends RouteBuilder(context) {
  private val logger = LoggerFactory.getLogger(classOf[ImportRoutes])

  override def configure(): Unit = {
    from(s"kafka:${kafkaConfig.topics.`import`}?brokers=${kafkaConfig.host}")
      .process((exchange: Exchange) => {
        val body = exchange.getIn.getBody(classOf[Array[Byte]])
        logger.info("Begin processing Import request")
        val request = ImportEnvelope.parseFrom(body)
        importService.performSensorDataImport(request)
      })
  }
}
