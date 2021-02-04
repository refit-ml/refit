package edu.cdl.iot.prediction.camel.routes

import java.util.UUID

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.yaml.KafkaConfig
import edu.cdl.iot.prediction.camel.Constants
import edu.cdl.iot.prediction.core.service.PredictionService
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange}


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
        val projectGuid = UUID.fromString(prediction.projectGuid)
        val schema = predictionService.getSchema(projectGuid)
        exchange.getIn().setHeader(Constants.SCHEMA_HEADER, schema)
      })
      .process((exchange: Exchange) => {
        val record = exchange.getIn().getBody(classOf[Prediction])
        println(s"Message Received\n\tProject: ${record.projectGuid}\n\tPrediction: ${record.prediction}")
      })
      .process((exchange: Exchange) => {
        val prediction = exchange.getIn().getBody(classOf[Prediction])
        val schema = exchange.getIn().getHeader(Constants.SCHEMA_HEADER, classOf[Schema])
        predictionService.savePrediction(prediction, schema)
      })
  }
}