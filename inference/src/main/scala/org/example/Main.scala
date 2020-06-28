package org.example


import java.util.{Optional, Properties}

import org.apache.flink.api.common.serialization.{SerializationSchema, SimpleStringSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarProducer, FlinkPulsarSink, PulsarSourceBuilder, TopicKeyExtractor}
import org.apache.pulsar.client.impl.auth.AuthenticationDisabled
import org.apache.pulsar.shade.org.glassfish.hk2.api.messaging.Topic
import org.apache.flink.streaming.api.scala._
import org.apache.flink.streaming.connectors.pulsar.partitioner.PulsarKeyExtractor
import org.codehaus.jackson.map.ser.std.StdKeySerializers.StringKeySerializer


//sensor_id,timestamp,temperature,pressure,wind
case class SensorData(sensor_id: Int, timestamp: String, temperature: Int, pressure: Int, wind: Int)

object Main {
  def main(args: Array[String]) {
    Thread.sleep(60000)
    val env = StreamExecutionEnvironment.getExecutionEnvironment()
    val serviceUrl = "pulsar://localhost:6650"
    val inputTopic = "persistent://sample/standalone/ns1/u"
    val outputTopic = "persistent://sample/standalone/ns1/o"
    val subscribtionName = "scala-sub-1"

    val props = new Properties()
    props.setProperty("topic", outputTopic)

    val src = PulsarSourceBuilder.builder(new SimpleStringSchema())
      .serviceUrl(serviceUrl)
      .topic(inputTopic)
      .subscriptionName(subscribtionName)
      .build()

    val input = env.addSource(src)
    input.print().setParallelism(1)

    val p = new FlinkPulsarProducer[String](
      serviceUrl,
      outputTopic,
      new StringSerializer,
      new StringKeyExtractor
    )

    input.addSink(p)




    env.execute("Test Job")


  }
}

class StringSerializer extends SerializationSchema[String] {
  override def serialize(element: String): Array[Byte] = element.getBytes()
}

class StringKeyExtractor extends PulsarKeyExtractor[String] {
  override def getKey(in: String): String = in
}