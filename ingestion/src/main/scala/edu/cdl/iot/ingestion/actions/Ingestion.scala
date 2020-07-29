package edu.cdl.iot.ingestion.actions

import java.time.LocalDateTime

import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.pulsar.client.api.Schema
import org.apache.pulsar.shade.org.eclipse.util.LazyList

import scala.util.Random

object Ingestion {

  def random(random: Random, start: Int, end: Int): Int = start + random.nextInt((end - start) + 1)

  def simulate(client: PulsarClient, namespace: String, topicName: String, sleepIntervalMils: Long): Unit = {
    val currTime = LocalDateTime.now()

    val schema = Schema.BYTES
    val topic = Topic(s"persistent://sample/standalone/${namespace}/${topicName}")
    val producerConfig = ProducerConfig(topic)

    val producer = client.producer[Array[Byte]](producerConfig)(schema)
    val r = new scala.util.Random

    print("Begin sending messages")
    while (true) {
      val timestamp = currTime
      val x = new SensorData(random(r, 5000, 5005).toInt,
        timestamp.toString,
        Map(
          "wind" -> random(r, 30, 101).toDouble,
          "pressure" -> random(r, 900, 1201).toDouble,
          "temperature" -> random(r, 0, 105).toDouble
        ),
        Map(
          "timestamp" -> timestamp.toString
        ),
        Map(
          "hour" -> timestamp.getHour
        )
      )
      print(s"\nSend message: ${x.sensorId} ${x.timestamp} ${x.doubles} ${x.integers} ${x.strings}\n")
      val res = producer.send(x.toByteArray)
      Thread.sleep(sleepIntervalMils)
    }

    producer.close()
  }

}
