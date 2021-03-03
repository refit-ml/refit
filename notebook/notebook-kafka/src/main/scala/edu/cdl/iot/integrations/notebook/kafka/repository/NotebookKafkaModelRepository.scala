package edu.cdl.iot.integrations.notebook.kafka.repository

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.kafka.repository.KafkaModelRepository
import edu.cdl.iot.integrations.notebook.core.repository.NotebookModelRepository

class NotebookKafkaModelRepository(kafkaRepository: KafkaRepository)
  extends KafkaModelRepository(kafkaRepository) with NotebookModelRepository