package com.cdl.iot

import java.util.Properties

import cdl.iot.dto.Model.Model
import com.cdl.iot.schema.{ModelSchema, SensorDataSchema}
import com.cdl.iot.transform.{EvaluationProcessor, SensorDataKeyExtractor, SensorDataSerializer}
import com.cdl.iot.util.helpers
import org.apache.flink.api.common.serialization.{DeserializationSchema, SimpleStringSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation
import org.apache.flink.api.java.utils.ParameterTool
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.FlinkPulsarSource
//import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarProducer, PulsarSourceBuilder}
import org.apache.flink.streaming.api.CheckpointingMode



object Main {
  def main(args: Array[String]) {

    val env: StreamExecutionEnvironment = StreamExecutionEnvironment.getExecutionEnvironment

    val params = ParameterTool.fromArgs(args)
    val config = env.getCheckpointConfig


    val pulsarHost = helpers.env_var("PULSAR_HOST", "localhost", params)
    val inputTopic = helpers.env_var("INPUT_TOPIC", "persistent://sample/standalone/default/in", params)
    val outputTopic = helpers.env_var("OUTPUT_TOPIC", "persistent://public/standalone/default/event-log", params)
    val subscribtionName = helpers.env_var("SUBSCRIPTION_NAME", "scala-sub-1", params)
    val modelTopic = helpers.env_var("MODEL_TOPIC", "persistent://sample/standalone/default/models", params)
    val subscribtionNameModels = helpers.env_var("SUBSCRIPTION_NAME", "scala-sub-2", params)
    val checkpointInterval = helpers.env_var("CHECKPOINT_INTERVAL", (1000 * 60).toString, params).toInt
    val serviceUrl = s"pulsar://${pulsarHost}:6650"
    val adminUrl = s"http://${pulsarHost}:8080"

    config.setCheckpointingMode(CheckpointingMode.EXACTLY_ONCE)
    config.setCheckpointInterval(checkpointInterval)

    val props = new Properties()



    val modelsrc = new FlinkPulsarSource[Model](
      serviceUrl, adminUrl, new DeserializationSchema[Model] {
        override def deserialize(message: Array[Byte]): Model = ???

        override def isEndOfStream(nextElement: Model): Boolean = ???

        override def getProducedType: TypeInformation[Model] = ???
      },
      new Properties()
        .setProperty("topic", modelTopic)
    )


//      PulsarSourceBuilder.builder(new ModelSchema)
//      .serviceUrl(serviceUrl)
//      .topic(modelTopic)
//      .subscriptionName(subscribtionNameModels)
//      .build()


    val model = env
      .addSource(modelsrc)
      .broadcast()

    model.print()


//    val eventSrc = PulsarSourceBuilder.builder(new SensorDataSchema)
//      .serviceUrl(serviceUrl)
//      .topic(inputTopic)
//      .subscriptionName(subscribtionName)
//      .build()

    val input = env.addSource(eventSrc)

    val inference = input
      .connect(model)
      .process(new EvaluationProcessor)


//    inference.addSink(new FlinkPulsarProducer(
//      serviceUrl,
//      outputTopic,
//      new SensorDataSerializer,
//      new SensorDataKeyExtractor
//    ))

    env.execute("Test Job")
  }
}








