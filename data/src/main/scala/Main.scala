import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import org.apache.pulsar.client.api.Schema
import java.time.LocalDateTime

import scala.util.Random
import scala.io.Source
import cdl.iot.SensorData.SensorData

object Main {

  def env(name: String, default: String): String = if (sys.env.contains(name)) sys.env(name) else default

  def main(args: Array[String]) {
    val sleepIntervalMils = env("INTERVAL_MILS", "5000").toInt
    val hostName = env("PULSAR_HOST", "localhost")
    val topicName = env("TOPIC_NAME", "in")
    val namespace = env("NAMESPACE_NAME", "default")


    val client = PulsarClient(s"pulsar://${hostName}:6650")


    val currTime = LocalDateTime.now()

    def lst: LazyList[SensorData] = {
      def loop(v: Int): LazyList[SensorData] = {
        new SensorData(Random.between(5000, 5005), (currTime.plusSeconds(v)).toString, Random.between(30, 101), Random.between(900, 1201), Random.between(0, 70)) #:: loop(v + 5)
      }
      loop(0)
    }

    val schema = Schema.BYTES
    val topic = Topic(s"persistent://sample/standalone/${namespace}/${topicName}")
    val producerConfig = ProducerConfig(topic)
    val producer = client.producer[Array[Byte]](producerConfig)(schema)

    print("Begin sending messages")
    lst.foreach(x => {
      print(s"\nSend message: ${x.sensorId} ${x.timestamp} ${x.temperature} ${x.pressure} ${x.wind}\n")
      producer.send(x.toByteArray)
      Thread.sleep(sleepIntervalMils)
    })

    producer.close()
    client.close()
  }
}
