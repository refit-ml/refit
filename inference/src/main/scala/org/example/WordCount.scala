package org.example

import org.apache.flink.api.common.serialization.SimpleStringSchema
import org.apache.flink.api.scala._
import org.apache.flink.streaming.api.scala.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.PulsarSourceBuilder
import org.apache.pulsar.client.api.PulsarClient
import org.apache.pulsar.client.impl.conf.ClientConfigurationData

//sensor_id,timestamp,temperature,pressure,wind
case class SensorData(sensor_id: Int, timestamp: String, temperature: Int, pressure: Int, wind: Int)

object WordCount {
  def main(args: Array[String]) {
    val env = StreamExecutionEnvironment.createLocalEnvironment()
    val clientConfigurationData = ClientConfiguration()
    val builder = PulsarSourceBuilder.builder(new SimpleStringSchema())
                 .serviceUrl("pulsar://localhost:6650")
                 .topic("persistent://sample/standalone/ns1/b")
                 .subscriptionName("inference-1")
      .pulsarAllClientConf()




    val src = builder.build();
    val input = env.addSource(src);

    val c = input.map( x => {
      print("HERE")
      s"Recieved: ${x}"
    }).setParallelism(1)



    env.execute("Test Job")

  }
}

