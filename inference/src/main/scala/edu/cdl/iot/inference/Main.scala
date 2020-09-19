package edu.cdl.iot.inference


import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.inference.schema.{ModelSchema, PredictionSchema, SensorDataSchema}
import edu.cdl.iot.inference.transform.{EvaluationProcessor, PredictionKeyExtractor, SensorDataMapper}
import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.java.functions.KeySelector
import org.apache.flink.streaming.api.CheckpointingMode
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarProducer, PulsarSourceBuilder}
import org.apache.pulsar.client.impl.conf.{ClientConfigurationData, ProducerConfigurationData}

object Subscriptions {
  val data = "inference-data"
  val models = "inference-models"
}

object Sources {
  val data = "Event Data"
  val models = "Model Updates"
}

object Main {
  def main(args: Array[String]) {
    val resourceFileName = "/inference.yaml"
    val env: StreamExecutionEnvironment = StreamExecutionEnvironment.getExecutionEnvironment

    val config = env.getCheckpointConfig
    val configFactory = new ConfigFactory()
    val refitConfig = configFactory.getConfig(getClass.getResourceAsStream(resourceFileName))
    val pulsarConfig = refitConfig.getPulsarConfig()
    val pulsarHost = pulsarConfig.host
    val inputTopic = pulsarConfig.topics.data
    val outputTopic = pulsarConfig.topics.predictions
    val modelTopic = pulsarConfig.topics.models

    val checkpointInterval = (1000 * 60)
    println(s"pulsar host: $pulsarHost")

    config.setCheckpointingMode(CheckpointingMode.EXACTLY_ONCE)
    config.setCheckpointInterval(checkpointInterval)


    val modelSrc = PulsarSourceBuilder.builder(new ModelSchema)
      .serviceUrl(pulsarHost)
      .topic(modelTopic)
      .subscriptionName(Subscriptions.models)
      .build()


    val model = env
      .addSource(modelSrc, Sources.models)
      .broadcast()
      .keyBy(new KeySelector[Model, String] {
        override def getKey(value: Model): String = value.projectGuid
      })

    val eventSrc = PulsarSourceBuilder.builder(new SensorDataSchema)
      .serviceUrl(pulsarHost)
      .topic(inputTopic)
      .subscriptionName(Subscriptions.data)
      .build()

    val input = env
      .addSource(eventSrc, Sources.data)
      .keyBy(new KeySelector[SensorData, String] {
        override def getKey(value: SensorData): String = value.projectGuid
      })


    val inference = input
      .connect(model)
      .process(new EvaluationProcessor)

    val ccd = new ClientConfigurationData()

    ccd.setServiceUrl(pulsarHost)

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








