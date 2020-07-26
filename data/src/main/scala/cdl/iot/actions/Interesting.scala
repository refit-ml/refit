package cdl.iot.actions

import java.time.LocalDateTime

import cdl.iot.dto.SensorData.SensorData
import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import org.apache.pulsar.client.api.Schema

import scala.util.Random

object Interesting {

  def simulate(client: PulsarClient, namespace: String, topicName: String, sleepIntervalMils: Long): Unit = {
    val currTime = LocalDateTime.now()

    val timestamp = "2020-06-28 09:30:01"
    val x = new SensorData(
      10814,
      timestamp,
      Map(
        "wind" -> 40.0,
        "pressure" -> 1068.0,
        "temperature" -> 50.0
      ),
      Map(
        "timestamp" -> timestamp
      ),
      Map(
        "hour" -> 9
      )
    )

    val schema = Schema.BYTES
    val topic = Topic(s"persistent://sample/standalone/${namespace}/${topicName}")
    val producerConfig = ProducerConfig(topic)

    val producer = client.producer[Array[Byte]](producerConfig)(schema)

    print("Begin sending messages")
    print(s"\nSend message: ${x.sensorId} ${x.timestamp} ${x.doubles} ${x.integers} ${x.strings}\n")
    producer.send(x.toByteArray)

    producer.close()
  }
}
