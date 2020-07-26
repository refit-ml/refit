package cdl.iot.actions

import java.time.LocalDateTime

import cdl.iot.dto.SensorData.SensorData
import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import org.apache.pulsar.client.api.Schema

import scala.util.Random

object Ingestion {

  def simulate(client: PulsarClient, namespace: String, topicName: String, sleepIntervalMils: Long): Unit = {
    val currTime = LocalDateTime.now()

    def lst: LazyList[SensorData] = {
      def loop(v: Int): LazyList[SensorData] = {
        val timestamp = currTime.plusSeconds(v)
        new SensorData(Random.between(5000, 5005),
          timestamp.toString,
          Map(
            "wind" -> Random.between(30, 101).toDouble,
            "pressure" -> Random.between(900, 1201).toDouble,
            "temperature" -> Random.between(0, 70).toDouble
          ),
          Map(
            "timestamp" -> timestamp.toString
          ),
          Map(
            "hour" -> timestamp.getHour
          )
        ) #:: loop(v + 5)
      }

      loop(0)
    }

    val schema = Schema.BYTES
    val topic = Topic(s"persistent://sample/standalone/${namespace}/${topicName}")
    val producerConfig = ProducerConfig(topic)

    val producer = client.producer[Array[Byte]](producerConfig)(schema)

    print("Begin sending messages")
    lst.foreach(x => {
      print(s"\nSend message: ${x.sensorId} ${x.timestamp} ${x.doubles} ${x.integers} ${x.strings}\n")
      producer.send(x.toByteArray)
      Thread.sleep(sleepIntervalMils)
    })

    producer.close()
  }

}
