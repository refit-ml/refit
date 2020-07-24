package com.cdl.iot


import java.util.Optional

import cdl.iot.dto.Model.Model
import cdl.iot.dto.SensorData.SensorData
import com.cdl.iot.schema.{ModelSchema, SensorDataSchema}
import com.cdl.iot.transform.{EvaluationProcessor, SensorDataKeyExtractor}
import com.cdl.iot.util.helpers
import org.apache.flink.api.java.utils.ParameterTool
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.api.CheckpointingMode
import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarSink, FlinkPulsarSource}


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


    val modelProps = new java.util.Properties()
    modelProps.setProperty("topic", modelTopic)

    val modelSrc = new FlinkPulsarSource[Model](
      serviceUrl,
      adminUrl,
      new ModelSchema,
      modelProps
    )


    val model = env
      .addSource(modelSrc)
      .broadcast()

    model.print()

    val eventProps = new java.util.Properties()
    eventProps.setProperty("topic", inputTopic)

    val eventSrc = new FlinkPulsarSource[SensorData](
      serviceUrl,
      adminUrl,
      new SensorDataSchema,
      eventProps
    )

    val input = env.addSource(eventSrc)

    val inference = input
      .connect(model)
      .process(new EvaluationProcessor)

    val outputProps = new java.util.Properties()
    outputProps.setProperty("topic", outputTopic)


    inference.addSink(new FlinkPulsarSink[SensorData](
      serviceUrl,
      adminUrl,
      Optional.of(outputTopic),
      outputProps,
      new SensorDataKeyExtractor,
      classOf[SensorData]
    ))

    env.execute("Test Job")
  }
}








