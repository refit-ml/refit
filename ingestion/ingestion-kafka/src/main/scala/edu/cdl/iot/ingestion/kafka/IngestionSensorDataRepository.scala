package edu.cdl.iot.ingestion.kafka

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.kafka.repository.KafkaSensorDataRepository
import edu.cdl.iot.ingestion.core.repository.SensorDataRepository

class IngestionSensorDataRepository(kafkaRepository: KafkaRepository)
  extends KafkaSensorDataRepository(kafkaRepository) with SensorDataRepository