package edu.cdl.iot.integrations.notebook.kafka.repository

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.kafka.repository.KafkaSensorDataRepository
import edu.cdl.iot.integrations.notebook.core.repository.NotebookSensorDataRepository

class NotebookKafkaSensorDataRepository(kafkaRepository: KafkaRepository)
  extends KafkaSensorDataRepository(kafkaRepository) with NotebookSensorDataRepository
