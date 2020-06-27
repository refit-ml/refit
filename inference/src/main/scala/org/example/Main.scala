package org.example


import org.apache.flink.api.common.serialization.SimpleStringSchema
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.PulsarSourceBuilder


//sensor_id,timestamp,temperature,pressure,wind
case class SensorData(sensor_id: Int, timestamp: String, temperature: Int, pressure: Int, wind: Int)

object Main {
  def main(args: Array[String]) {
    val env = StreamExecutionEnvironment.getExecutionEnvironment()

    val src = PulsarSourceBuilder.builder(new SimpleStringSchema())
      .serviceUrl("pulsar://pulsar:6650")
      .topic("persistent://sample/standalone/ns1/u")
      .subscriptionName("scala-sub-1")
      .build()

    val input = env.addSource(src)

    input.print().setParallelism(1)

    env.execute("Test Job")

  }
}

