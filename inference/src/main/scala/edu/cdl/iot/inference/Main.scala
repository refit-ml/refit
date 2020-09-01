package edu.cdl.iot.inference


import edu.cdl.iot.inference.schema.{ModelSchema, PredictionSchema, SensorDataSchema}
import edu.cdl.iot.inference.transform.{EvaluationProcessor, PredictionKeyExtractor, SensorDataMapper}
import edu.cdl.iot.inference.util.Helpers
import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.java.functions.KeySelector
import org.apache.flink.api.java.utils.ParameterTool
import org.apache.flink.streaming.api.CheckpointingMode
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarProducer, PulsarSourceBuilder}
import org.apache.pulsar.client.impl.conf.{ClientConfigurationData, ProducerConfigurationData}


object Main {
  def main(args: Array[String]) {

    val env: StreamExecutionEnvironment = StreamExecutionEnvironment.getExecutionEnvironment

    val params = ParameterTool.fromArgs(args)
    val config = env.getCheckpointConfig

    val pulsarHost = Helpers.env_var("PULSAR_HOST", "refit-pulsar-standalone", params)
    val inputTopic = Helpers.env_var("INPUT_TOPIC", "persistent://sample/standalone/ns1/sensors", params)
    val outputTopic = Helpers.env_var("OUTPUT_TOPIC", "persistent://sample/standalone/ns1/predictions", params)
    val subscribtionName = Helpers.env_var("SUBSCRIPTION_NAME", "scala-sub-1", params)
    val modelTopic = Helpers.env_var("MODEL_TOPIC", "persistent://sample/standalone/ns1/models", params)
    val subscribtionNameModels = Helpers.env_var("SUBSCRIPTION_NAME", "scala-sub-2", params)
    val checkpointInterval = Helpers.env_var("CHECKPOINT_INTERVAL", (1000 * 60).toString, params).toInt

    val serviceUrl = s"pulsar://$pulsarHost:6650"

    println(s"pulsar host: $pulsarHost")

    config.setCheckpointingMode(CheckpointingMode.EXACTLY_ONCE)
    config.setCheckpointInterval(checkpointInterval)


    val modelSrc = PulsarSourceBuilder.builder(new ModelSchema)
      .serviceUrl(serviceUrl)
      .topic(modelTopic)
      .subscriptionName(subscribtionNameModels)
      .build()


    val model = env
      .addSource(modelSrc, "Models")
      .broadcast()
      .keyBy(new KeySelector[Model, String ] {
        override def getKey(value: Model): String = value.projectGuid
      })

    val eventSrc = PulsarSourceBuilder.builder(new SensorDataSchema)
      .serviceUrl(serviceUrl)
      .topic(inputTopic)
      .subscriptionName(subscribtionName)
      .build()

    val input = env
      .addSource(eventSrc, "Events")
      .keyBy(new KeySelector[SensorData, String ] {
        override def getKey(value: SensorData): String = value.projectGuid
      })


    val inference = input
      .connect(model)
      .process(new EvaluationProcessor)

    val ccd = new ClientConfigurationData()

    ccd.setServiceUrl(serviceUrl)

    val pcd = new ProducerConfigurationData()

    pcd.setTopicName(outputTopic)
    pcd.setProducerName("Inference Producer")


    inference.addSink(new FlinkPulsarProducer[Prediction](
      ccd,
      pcd,
      new PredictionSchema,
      new PredictionKeyExtractor
    ))

    env.execute("CDL IoT - Inference")
  }
}








