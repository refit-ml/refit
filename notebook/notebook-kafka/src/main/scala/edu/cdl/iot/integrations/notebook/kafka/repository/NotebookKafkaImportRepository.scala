package edu.cdl.iot.integrations.notebook.kafka.repository

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.integrations.notebook.core.repository.{NotebookImportRepository, NotebookStaticDataImportRepository, NotebookTrainingWindowImportRepository}
import edu.cdl.iot.protocol.Import.Import
import edu.cdl.iot.protocol.StaticDataImport.StaticDataImport

class NotebookKafkaImportRepository(kafkaRepository: KafkaRepository)
  extends NotebookImportRepository {

  def save(importRequest: Import): Unit =
    kafkaRepository.send(kafkaRepository.topics.`import`, importRequest.toByteArray)
}


class NotebookKafkaTrainingWindowImportRepository(kafkaRepository: KafkaRepository)
  extends NotebookTrainingWindowImportRepository {

  def save(importRequest: Import): Unit =
    kafkaRepository.send(kafkaRepository.topics.trainingWindowImport, importRequest.toByteArray)
}


class NotebookKafkaStaticDataImportRepository(kafkaRepository: KafkaRepository)
  extends NotebookStaticDataImportRepository {

  def save(importRequest: StaticDataImport): Unit =
    kafkaRepository.send(kafkaRepository.topics.staticDataImport, importRequest.toByteArray)
}