package edu.cdl.iot.ingestion.kafka

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.kafka.repository.KafkaImportRepository
import edu.cdl.iot.ingestion.core.repository.ImportRepository

class IngestionImportRepository(kafkaRepository: KafkaRepository)
  extends KafkaImportRepository(kafkaRepository) with ImportRepository
