package org.example


import org.apache.flink.api.common.serialization.SimpleStringSchema
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarProducer, PulsarSourceBuilder}
import org.apache.pulsar.client.impl.auth.AuthenticationDisabled


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

    val src = PulsarSourceBuilder.builder(new SimpleStringSchema())
      .serviceUrl(serviceUrl)
      .topic(inputTopic)
      .subscriptionName(subscribtionName)
      .build()

    val input = env.addSource(src)
    input.print().setParallelism(1)



    input.addSink(new FlinkPulsarProducer[String](
      serviceUrl,
      outputTopic,
      new AuthenticationDisabled(),
      (x) => x.hashCode()
    ))



    env.execute("Test Job")

  }
}

class Transporter {

}