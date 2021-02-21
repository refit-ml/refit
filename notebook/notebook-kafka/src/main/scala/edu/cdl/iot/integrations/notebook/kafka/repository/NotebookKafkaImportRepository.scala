package edu.cdl.iot.integrations.notebook.kafka.repository

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.kafka.repository.KafkaImportRepository
import edu.cdl.iot.integrations.notebook.core.repository.NotebookImportRepository

class NotebookKafkaImportRepository(kafkaRepository: KafkaRepository)
  extends KafkaImportRepository(kafkaRepository) with NotebookImportRepository
