package edu.cdl.iot.ingestion.kafka

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.kafka.repository.KafkaModelRepository
import edu.cdl.iot.ingestion.core.repository.ModelRepository

class IngestionModelRepository(kafkaRepository: KafkaRepository)
  extends KafkaModelRepository(kafkaRepository) with ModelRepository