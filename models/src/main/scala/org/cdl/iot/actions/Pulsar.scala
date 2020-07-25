package org.cdl.iot.actions

import cdl.iot.dto.Model.Model
import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import org.apache.pulsar.client.api.Schema


object Pulsar {
  def sendModel(host: String, model: Model) = {
    val client = PulsarClient(s"pulsar://${host}:6650")
    val schema = Schema.BYTES
    val topic = Topic("persistent://sample/standalone/ns1/models")
    val producerConfig = ProducerConfig(topic)
    val producer = client.producer[Array[Byte]](producerConfig)(schema)

    println(s"Sending Model ${model.key} to inference")
    producer.send(model.toByteArray)
    println("Sent")
    producer.close()
    client.close()
  }
}
