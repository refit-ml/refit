package edu.cdl.iot.ingestion.factories

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.ingestion.dao.ModelDao
import edu.cdl.iot.ingestion.transform.{ModelProcessors, PulsarProcessors, SenosrDataProcessors}

class ProcessorFactory(private val config: RefitConfig) {

  def getModelDao = new ModelDao(config.getCassandraConfig())

  def getModelProcessors(modelDao: ModelDao) = new ModelProcessors(modelDao)

  def getPulsarProcessors = new PulsarProcessors(config)

  def getSensorDataProcessors(modelDao: ModelDao) = new SenosrDataProcessors(config, modelDao)


}
