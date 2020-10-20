package edu.cdl.iot.ingestion.factories

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.ingestion.dao.{ImportDao, ModelDao}
import edu.cdl.iot.ingestion.transform.{ImportProcessors, ModelProcessors, SchemaProcessors, SenosrDataProcessors}
import org.apache.kafka.clients.producer.KafkaProducer

class ProcessorFactory(private val config: RefitConfig) {

  private val kafkaConfig = config.getKafkaConfig()
  private val kafkaProducer = new KafkaProducer[Array[Byte], Array[Byte]](kafkaConfig.getProperties("refit-import"))


  def getModelDao = new ModelDao(config.getCassandraConfig())

  def getImportDao = new ImportDao(config.getCassandraConfig())

  def getModelProcessors = new ModelProcessors(config, kafkaProducer)

  def getSensorDataProcessors(modelDao: ModelDao) = new SenosrDataProcessors(modelDao)

  def getImportProcessors(importDao: ImportDao) = new ImportProcessors(config, importDao, kafkaProducer)

  def getSchemaProcessors(importDao: ImportDao) = new SchemaProcessors(config, importDao)


}
