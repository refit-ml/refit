package edu.cdl.iot.ingestion.notebook.camel.routes

import edu.cdl.iot.common.yaml.KafkaConfig
import edu.cdl.iot.integrations.notebook.core.service.NotebookImportService
import edu.cdl.iot.protocol.Import.Import
import edu.cdl.iot.protocol.StaticDataImport.StaticDataImport
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange}
import org.slf4j.LoggerFactory

class NotebookImportRoutes(private val kafkaConfig: KafkaConfig,
                           private val importService: NotebookImportService,
                           private val context: CamelContext) extends RouteBuilder(context) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookImportRoutes])

  override def configure(): Unit = {
    from(s"kafka:${kafkaConfig.topics.`import`}?brokers=${kafkaConfig.host}")
      .process((exchange: Exchange) => {
        val body = exchange.getIn.getBody(classOf[Array[Byte]])
        logger.info("Begin processing Import request")
        val request = Import.parseFrom(body)
        importService.performSensorDataImport(request)
      })

    from(s"kafka:${kafkaConfig.topics.trainingWindowImport}?brokers=${kafkaConfig.host}")
      .process((exchange: Exchange) => {
        val body = exchange.getIn.getBody(classOf[Array[Byte]])
        logger.info("Begin processing training window import request")
        val request = Import.parseFrom(body)
        importService.performTrainingWindowImport(request)
      })

    from(s"kafka:${kafkaConfig.topics.staticDataImport}?brokers=${kafkaConfig.host}")
      .process((exchange: Exchange) => {
        val body = exchange.getIn.getBody(classOf[Array[Byte]])
        logger.info("Begin processing static data import request")
        val request = StaticDataImport.parseFrom(body)
        importService.performStaticDataImport(request)
      })
  }
}
