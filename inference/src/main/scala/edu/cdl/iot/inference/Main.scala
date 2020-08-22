package edu.cdl.iot.inference


import com.datastax.driver.core.Cluster
import edu.cdl.iot.inference.schema.{ModelSchema, PredictionSchema, SensorDataSchema}
import edu.cdl.iot.inference.transform.{EvaluationProcessor, PredictionKeyExtractor, SensorDataMapper}
import edu.cdl.iot.inference.util.helpers
import edu.cdl.iot.protocol.Model.Model
import org.apache.flink.streaming.connectors.cassandra.{CassandraSink, ClusterBuilder}
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

<<<<<<< HEAD

    val pulsarHost = helpers.env_var("PULSAR_HOST", "127.0.0.1", params)
=======
    val pulsarHost = helpers.env_var("PULSAR_HOST", "refit-pulsar-standalone", params)
>>>>>>> 3c14f3eda8632a729707f3b869fb5adaba907a59
    val inputTopic = helpers.env_var("INPUT_TOPIC", "persistent://sample/standalone/ns1/sensors", params)
    val outputTopic = helpers.env_var("OUTPUT_TOPIC", "" + "", params)
    val subscribtionName = helpers.env_var("SUBSCRIPTION_NAME", "scala-sub-1", params)
    val modelTopic = helpers.env_var("MODEL_TOPIC", "persistent://sample/standalone/ns1/models", params)
    val subscribtionNameModels = helpers.env_var("SUBSCRIPTION_NAME", "scala-sub-2", params)
    val checkpointInterval = helpers.env_var("CHECKPOINT_INTERVAL", (1000 * 60).toString, params).toInt
<<<<<<< HEAD

    val cassandraHost = helpers.env_var("CASSANDRA_HOST", "127.0.0.1", params)
=======
    val cassandraHost = helpers.env_var("CASSANDRA_HOST", "refit-cassandra", params)
>>>>>>> 3c14f3eda8632a729707f3b869fb5adaba907a59
    val cassandraUsername = helpers.env_var("CASSANDRA_USER", "cassandra", params)
    val cassandraPassword = helpers.env_var("CASSANDRA_PASSWORD", "cassandra", params)

    val serviceUrl = s"pulsar://$pulsarHost:6650"
    val adminUrl = s"http://$pulsarHost:8080"

    println(s"pulsar host: $pulsarHost")
    println(s"cassandra host: $cassandraHost")

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

    val eventTuple = inference.map(new SensorDataMapper)

    CassandraSink.addSink(eventTuple)
      .setClusterBuilder(
        new ClusterBuilder {
          override def buildCluster(builder: Cluster.Builder): Cluster = builder
            .withCredentials(cassandraUsername, cassandraPassword)
            .addContactPoint(cassandraHost)
            .build()
        }
      )
      .setQuery("INSERT INTO cdl_refit.sensor_data(project_guid, sensor_id, partition_key, timestamp, data, prediction ) values (?, ?, ?, ?, ?, ?);")
      .build()


    env.execute("CDL IoT - Inference")
  }
}








