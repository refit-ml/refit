package edu.cdl.iot.integrations.application.routes

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.yaml.KafkaConfig
import edu.cdl.iot.integrations.application.IntegrationConstants
import edu.cdl.iot.integrations.core.service.PredictionService
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.{CamelContext, Exchange, Processor}
import org.apache.camel.builder.RouteBuilder


class PredictionRoutes(private val context: CamelContext,
                       private val kafkaConfig: KafkaConfig,
                       private val predictionService: PredictionService) extends RouteBuilder(context) {

  override def configure(): Unit = {
    from(s"kafka:${kafkaConfig.topics.predictions}?brokers=${kafkaConfig.host}")
      .process((exchange: Exchange) => {
        val bytes = exchange.getIn().getBody(classOf[Array[Byte]])
        val prediction = Prediction.parseFrom(bytes)
        exchange.getIn.setBody(prediction)
      })
      .process((exchange: Exchange) => {
        val prediction = exchange.getIn().getBody(classOf[Prediction])
        val schema = predictionService.getSchema(prediction.projectGuid)
        exchange.getIn().setHeader(IntegrationConstants.SCHEMA_HEADER, schema)
      })
      .process((exchange: Exchange) => {
        val record = exchange.getIn().getBody(classOf[Prediction])
        println(s"Message Received\n\tProject: ${record.projectGuid}\n\tPrediction: ${record.prediction}")
      })
      .process((exchange: Exchange) => {
        val prediction = exchange.getIn().getBody(classOf[Prediction])
        val schema = exchange.getIn().getHeader(IntegrationConstants.SCHEMA_HEADER, classOf[Schema])
        predictionService.savePrediction(prediction, schema)
      })
  }
}