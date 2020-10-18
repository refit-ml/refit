package edu.cdl.iot.ingestion.factories

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.ingestion.dao.{ImportDao, ModelDao}
import edu.cdl.iot.ingestion.transform.{ ModelProcessors, SchemaProcessors, SenosrDataProcessors}

class ProcessorFactory(private val config: RefitConfig) {

  def getModelDao = new ModelDao(config.getCassandraConfig())

  def getImportDao = new ImportDao(config.getCassandraConfig())

  def getModelProcessors(modelDao: ModelDao) = new ModelProcessors(config)

  def getSensorDataProcessors(modelDao: ModelDao) = new SenosrDataProcessors(modelDao)

//  def getImportProcessors(importDao: ImportDao) = new ImportProcessors(config, importDao)

  def getSchemaProcessors(importDao: ImportDao) = new SchemaProcessors(config, importDao)


}
