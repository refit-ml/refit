package edu.cdl.iot.data.kafka.repository

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.protocol.Import.Import

class KafkaImportRepository(kafkaRepository: KafkaRepository) {

  def save(importRequest: Import): Unit =
    kafkaRepository.send(kafkaRepository.topics.`import`, importRequest.toByteArray)
}
