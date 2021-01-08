package edu.cdl.iot.data.kafka.repository

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.protocol.ImportRequest.ImportRequest

class KafkaImportRepository(kafkaRepository: KafkaRepository) {

  def saveImportRequest(importRequest: ImportRequest): Unit =
    kafkaRepository.send(kafkaRepository.topics.`import`, importRequest.toByteArray)
}
