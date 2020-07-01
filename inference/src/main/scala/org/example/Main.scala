package org.example

import cdl.iot.SensorData.SensorData
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarProducer, PulsarSourceBuilder}
import org.apache.flink.streaming.api.scala._
import org.apache.flink.streaming.connectors.pulsar.partitioner.PulsarKeyExtractor

//sensor_id,timestamp,temperature,pressure,wind

object Main {
  def main(args: Array[String]) {
    val env = StreamExecutionEnvironment.getExecutionEnvironment()
    val serviceUrl = "pulsar://localhost:6650"
    val inputTopic = "persistent://sample/standalone/ns1/in"
    val outputTopic = "persistent://sample/standalone/ns1/out"
    val subscribtionName = "scala-sub-1"

    val src = PulsarSourceBuilder.builder(new SensorDataSchema)
      .serviceUrl(serviceUrl)
      .topic(inputTopic)
      .subscriptionName(subscribtionName)
      .build()

    val input = env.addSource(src)


    val p = new FlinkPulsarProducer(
      serviceUrl,
      outputTopic,
      new SensorDataSerializer,
      new SensorDataKeyExtractor
    )

    input.addSink(p)
    env.execute("Test Job")
  }
}

class SensorDataKeyExtractor extends PulsarKeyExtractor[SensorData] {
  override def getKey(in: SensorData): String = in.sensorId.toString
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