package com.cdl.iot

import com.cdl.iot.schema.{ModelSchema, SensorDataSchema}
import com.cdl.iot.transform.{EvaluationProcessor, SensorDataKeyExtractor, SensorDataMapper}
import com.cdl.iot.util.helpers
import com.datastax.driver.core.Cluster
import org.apache.flink.api.java.utils.ParameterTool
import org.apache.flink.streaming.api.CheckpointingMode
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.cassandra.{CassandraSink, ClusterBuilder}
import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarProducer, PulsarSourceBuilder}


object Main {
  def main(args: Array[String]) {

    val env: StreamExecutionEnvironment = StreamExecutionEnvironment.getExecutionEnvironment

    val params = ParameterTool.fromArgs(args)
    val config = env.getCheckpointConfig


    val pulsarHost = helpers.env_var("PULSAR_HOST", "pulsar-standalone", params)
    val inputTopic = helpers.env_var("INPUT_TOPIC", "persistent://sample/standalone/ns1/in", params)
    val outputTopic = helpers.env_var("OUTPUT_TOPIC", "persistent://sample/standalone/ns1/event-log", params)
    val subscribtionName = helpers.env_var("SUBSCRIPTION_NAME", "scala-sub-1", params)
    val modelTopic = helpers.env_var("MODEL_TOPIC", "persistent://sample/standalone/ns1/models", params)
    val subscribtionNameModels = helpers.env_var("SUBSCRIPTION_NAME", "scala-sub-2", params)
    val checkpointInterval = helpers.env_var("CHECKPOINT_INTERVAL", (1000 * 60).toString, params).toInt

    val cassandraHost = helpers.env_var("CASSANDRA_HOST", "cassandra", params)
    val cassandraUsername = helpers.env_var("CASSANDRA_USER", "cassandra", params)
    val cassandraPassword = helpers.env_var("CASSANDRA_PASSWORD", "cassandra", params)

    val serviceUrl = s"pulsar://${pulsarHost}:6650"
    val adminUrl = s"http://${pulsarHost}:8080"

    println(s"pulsar host: ${pulsarHost}")
    println(s"cassandra host: ${cassandraHost}")

        config.setCheckpointingMode(CheckpointingMode.EXACTLY_ONCE)
        config.setCheckpointInterval(checkpointInterval)


    val modelProps = new java.util.Properties()
    modelProps.setProperty("topic", "persistent://sample/standalone/ns1/models")

    val modelSrc = PulsarSourceBuilder.builder(new ModelSchema)
      .serviceUrl(serviceUrl)
      .topic(modelTopic)
      .subscriptionName(subscribtionNameModels)
      .build()



    val model = env
      .addSource(modelSrc)
      .broadcast()


    val eventProps = new java.util.Properties()
    eventProps.setProperty("topic", "persistent://sample/standalone/ns1/in")

    val eventSrc = PulsarSourceBuilder.builder(new SensorDataSchema)
      .serviceUrl(serviceUrl)
      .topic(inputTopic)
      .subscriptionName(subscribtionName)
      .build()


    val input = env.addSource(eventSrc)


    val inference = input
      .connect(model)
      .process(new EvaluationProcessor)

    val outputProps = new java.util.Properties()
    outputProps.setProperty("topic", "persistent://sample/standalone/ns1/events")


    inference.addSink(new FlinkPulsarProducer(
      serviceUrl,
      outputTopic,
      new SensorDataSchema,
      new SensorDataKeyExtractor
    ))

    CassandraSink.addSink(inference.map(new SensorDataMapper))
      .setClusterBuilder(
        new ClusterBuilder {
          override def buildCluster(builder: Cluster.Builder): Cluster = builder
            .withCredentials(cassandraUsername, cassandraPassword)
            .addContactPoint(cassandraHost)
            .build()
        }
      )
      .setQuery("INSERT INTO iot_prototype_training.sensor_data(key,sensor_id, timestamp, data, prediction) values (?, ?, ?, ?, ?);")
      .build()


    env.execute("Test Job")
  }
}








