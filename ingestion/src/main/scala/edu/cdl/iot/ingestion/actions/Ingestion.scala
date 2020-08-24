package edu.cdl.iot.ingestion.actions

import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.pulsar.client.api.Schema
import org.joda.time.{DateTime, DateTimeZone}

import scala.util.Random

object Ingestion {

  def random(random: Random, start: Int, end: Int): Int = start + random.nextInt((end - start) + 1)

  def simulate(client: PulsarClient, namespace: String, topicName: String, sleepIntervalMils: Long): Unit = {

    val schema = Schema.BYTES
    val topic = Topic(s"persistent://sample/standalone/${namespace}/${topicName}")
    val producerConfig = ProducerConfig(topic)

    val producer = client.producer[Array[Byte]](producerConfig)(schema)
    val r = new scala.util.Random
    val projectGuid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"

    print("Begin sending messages")
    while (true) {
      val timestamp = DateTime.now.toDateTime(DateTimeZone.UTC)
      val x = new SensorData(projectGuid, random(r, 5000, 5005).toString,
        timestamp.toString("yyyy-MM-dd HH:mm:ss"),
        Map(
          "wind" -> random(r, 30, 101).toDouble,
          "pressure" -> random(r, 900, 1201).toDouble,
          "temperature" -> random(r, 0, 105).toDouble
        ),
        Map(),
        Map(
          "hour" -> timestamp.getHourOfDay
        )
      )
      print(s"\nSend message: ${x.sensorId} ${x.timestamp} ${x.doubles} ${x.integers} ${x.strings}\n")
      val res = producer.send(x.toByteArray)
      Thread.sleep(sleepIntervalMils)
    }

    producer.close()
  }

}
