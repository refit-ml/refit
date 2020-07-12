package org.example

import cdl.iot.SensorData.SensorData
import com.datastax.driver.core.Cluster
import org.apache.flink.api.common.functions.MapFunction
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarProducer, PulsarSourceBuilder}
import org.apache.flink.streaming.api.scala._
import org.apache.flink.streaming.connectors.cassandra.{CassandraSink, ClusterBuilder}
import org.apache.flink.streaming.connectors.pulsar.partitioner.PulsarKeyExtractor


object Main {

  def main(args: Array[String]) {

    val env = StreamExecutionEnvironment.getExecutionEnvironment()

    val serviceUrl = "pulsar://localhost:6650"
    val inputTopic = "persistent://sample/standalone/default/in"
    val outputTopic = "persistent://public/standalone/default/event-log"
    val subscribtionName = "scala-sub-1"
    val cassandraHost = "127.0.0.1"
    val cassandraUsername = "cassandra"
    val cassandraPassword = "cassandra"

    val src = PulsarSourceBuilder.builder(new SensorDataSchema)
      .serviceUrl(serviceUrl)
      .topic(inputTopic)
      .subscriptionName(subscribtionName)
      .build()

    val input = env.addSource(src)

    val inference = input.map(new SensorDataMapper)

    CassandraSink.addSink(inference)
      .setClusterBuilder(
        new ClusterBuilder {
          override def buildCluster(builder: Cluster.Builder): Cluster = builder
            .withCredentials(cassandraUsername, cassandraPassword)
            .addContactPoint(cassandraHost)
            .build()
        }
      )
      .setQuery("INSERT INTO iot_prototype_training.sensor_data(key, value) values (?, ?);")
      .build()

    input.addSink(new FlinkPulsarProducer(
      serviceUrl,
      outputTopic,
      new SensorDataSerializer,
      new SensorDataKeyExtractor
    ))

    env.execute("Test Job")
  }
}

class SensorDataMapper extends MapFunction[SensorData, org.apache.flink.api.java.tuple.Tuple2[String, String]] {
  override def map(value: SensorData): org.apache.flink.api.java.tuple.Tuple2[String, String] = new org.apache.flink.api.java.tuple.Tuple2(s"${value.timestamp}_${value.sensorId}", value.toProtoString)
}

class SensorDataKeyExtractor extends PulsarKeyExtractor[SensorData] {
  override def getKey(in: SensorData): String = in.timestamp
}

class SensorDataSerializer extends SerializationSchema[SensorData] {
  override def serialize(element: SensorData): Array[Byte] = s"${element.sensorId},${element.pressure},${element.temperature},${element.wind}".getBytes()
}

class SensorDataSchema extends DeserializationSchema[SensorData] {
  override def deserialize(message: Array[Byte]): SensorData = {
    val ret = SensorData.parseFrom(message)
    println(s"Recieved: SID: ${ret.sensorId}, temp: ${ret.temperature}, wind: ${ret.wind}, pressure: ${ret.pressure}")
    ret
  }

  override def isEndOfStream(nextElement: SensorData): Boolean = true

  override def getProducedType: TypeInformation[SensorData] = createTypeInformation[SensorData]
}