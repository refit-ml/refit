package edu.cdl.iot.inference


import java.util.Properties

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.inference.schema.{ModelSchema, PredictionSchema, SensorDataSchema}
import edu.cdl.iot.inference.transform.EvaluationProcessor
import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.java.functions.KeySelector
import org.apache.flink.shaded.jackson2.com.fasterxml.jackson.databind.ObjectMapper
import org.apache.flink.streaming.api.CheckpointingMode
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.kafka.{FlinkKafkaConsumer, FlinkKafkaProducer}
import com.fasterxml.jackson.module.scala.DefaultScalaModule


object Subscriptions {
  val data = "inference-data"
  val models = "inference-models"
}

object Sources {
  val data = "Event Data"
  val models = "Model Updates"
}

object Main {

  def kafka(): Unit = {
    val env: StreamExecutionEnvironment = StreamExecutionEnvironment.getExecutionEnvironment

    val properties = new Properties()
    properties.setProperty("bootstrap.servers", "localhost:9092")
    properties.setProperty("group.id", "test")


  }

  def main(args: Array[String]) {
    val resourceFileName = "/inference.yaml"
    val env: StreamExecutionEnvironment = StreamExecutionEnvironment.getExecutionEnvironment

    val config = env.getCheckpointConfig
    val configFactory = new ConfigFactory()
    val refitConfig = configFactory.getConfig(getClass.getResourceAsStream(resourceFileName))
    val kafkaSettings = refitConfig.getKafkaConfig()


    val kafkaConfig = kafkaSettings.getProperties("refit.inference")

    val checkpointInterval = (1000 * 60)
    println(s"Kafka host: ${kafkaSettings.host}")

    config.setCheckpointingMode(CheckpointingMode.EXACTLY_ONCE)
    config.setCheckpointInterval(checkpointInterval)


    val modelSrc = new FlinkKafkaConsumer[Model](kafkaSettings.topics.models, new ModelSchema, kafkaConfig)

    val model = env
      .addSource(modelSrc, Sources.models)
      .broadcast()
      .keyBy(new KeySelector[Model, String] {
        override def getKey(value: Model): String = value.projectGuid
      })


    val eventSrc = new FlinkKafkaConsumer[SensorData](kafkaSettings.topics.data, new SensorDataSchema(), kafkaConfig)

    val input = env
      .addSource(eventSrc, Sources.data)
      .keyBy(new KeySelector[SensorData, String] {
        override def getKey(value: SensorData): String = value.projectGuid
      })







    val mapper = new ObjectMapper()
    mapper.registerModule(DefaultScalaModule)



    /*val raw = new FlinkKafkaProducer[SensorData]
    mapper.writeValue(raw, input)
    val json = raw.
*/


/*
    val raw = new FlinkKafkaProducer[SensorData](kafkaSettings.topics    , new TableSchema(), kafkaConfig)

    val enrichedSrc = new FlinkKafkaConsumer[SensorData](    , new TableSchema(), kafkaConfig)


*/
    val inference = input
      .connect(model)
      .process(new EvaluationProcessor)


    val sink = new FlinkKafkaProducer[Prediction](
      kafkaSettings.topics.predictions,
      new PredictionSchema(kafkaSettings.topics.predictions),
      kafkaConfig,
      FlinkKafkaProducer.Semantic.AT_LEAST_ONCE
    )


    inference.addSink(sink)

    env.execute("CDL IoT - Inference")
  }
}








