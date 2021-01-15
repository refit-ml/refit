package edu.cdl.iot.inference.application

import java.util.Properties

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.inference.application.constants.Sources
import edu.cdl.iot.inference.application.schema.{ModelSchema, PredictionSchema, SensorDataJsonSchema, SensorDataSchema}
import edu.cdl.iot.inference.application.transform.EvaluationProcessor
import edu.cdl.iot.inference.minio.InferenceMinioModelFileRepository
import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.streaming.api.CheckpointingMode
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.kafka.{FlinkKafkaConsumer, FlinkKafkaProducer}

object Main {

  def main(args: Array[String]) {
    val resourceFileName = "/inference.yaml"
    val env: StreamExecutionEnvironment = StreamExecutionEnvironment.getExecutionEnvironment

    val config = env.getCheckpointConfig
    val configFactory = new ConfigFactory()
    val refitConfig = configFactory.getConfig(getClass.getResourceAsStream(resourceFileName))
    val kafkaSettings = refitConfig.getKafkaConfig()

    val kafkaConfig = new Properties
    kafkaConfig.put("bootstrap.servers", kafkaSettings.host)
    kafkaConfig.put("auto.offset.reset", "latest")
    kafkaConfig.put("group.id", "refit.inference")

    val checkpointInterval = 1000 * 60
    println(s"Kafka host: ${kafkaSettings.host}")

    config.setCheckpointingMode(CheckpointingMode.EXACTLY_ONCE)
    config.setCheckpointInterval(checkpointInterval)

    val modelSrc = new FlinkKafkaConsumer[Model](kafkaSettings.topics.modelPublished, new ModelSchema, kafkaConfig)
    val rawSensorDataSource = new FlinkKafkaConsumer[SensorData](kafkaSettings.topics.data, new SensorDataSchema, kafkaConfig)
    val sensorDataSource = new FlinkKafkaConsumer[SensorData](kafkaSettings.topics.sensorData, new SensorDataJsonSchema, kafkaConfig)


    val model = env
      .addSource(modelSrc, Sources.models)
      .broadcast()
      .keyBy((value: Model) => value.projectGuid)

    val rawSensorData = env
      .addSource(rawSensorDataSource, Sources.rawData)


    val sensorData = env
      .addSource(sensorDataSource, Sources.sensorData)
      .keyBy((value: SensorData) => value.projectGuid)


    val inference = sensorData
      .connect(model)
      .process(new EvaluationProcessor)

    val predictionSink = new FlinkKafkaProducer[Prediction](
      kafkaSettings.topics.predictions,
      new PredictionSchema,
      kafkaConfig
    )

    val rawSensorDataSink = new FlinkKafkaProducer[SensorData](
      kafkaSettings.topics.rawSensorData,
      new SensorDataJsonSchema,
      kafkaConfig
    )

    inference.addSink(predictionSink)
    rawSensorData.addSink(rawSensorDataSink)

    env.execute("CDL IoT - Inference")
  }
}








