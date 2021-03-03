package edu.cdl.iot.data.kafka.repository

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.protocol.Model.Model

class KafkaModelRepository(kafkaRepository: KafkaRepository) {

  def save(model: Model): Unit =
    kafkaRepository.send(kafkaRepository.topics.modelPublished, model.toByteArray)
}
