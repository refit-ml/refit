package edu.cdl.iot.data.kafka

import java.util.concurrent.Future

import edu.cdl.iot.common.yaml.{KafkaConfig, KafkaTopic}
import org.apache.kafka.clients.producer.{KafkaProducer, ProducerRecord, RecordMetadata}

class KafkaRepository(config: KafkaConfig, groupIdentifier: String) {
  private val kafkaProducer = new KafkaProducer[Array[Byte], Array[Byte]](config.getProperties(groupIdentifier))

  val topics: KafkaTopic = config.topics

  def send(topic: String, payload: Array[Byte]): Future[RecordMetadata] = kafkaProducer.send((new ProducerRecord[Array[Byte], Array[Byte]](
    topic,
    payload
  )))
}
