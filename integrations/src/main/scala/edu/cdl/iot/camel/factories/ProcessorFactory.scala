package edu.cdl.iot.camel.factories

import edu.cdl.iot.camel.dao.{GrafanaDao, PredictionDao, SchemaDao}
import edu.cdl.iot.camel.transform.{GrafanaProcessors, PredictionProcessors, PulsarProcessors, SchemaProcessors}
import edu.cdl.iot.common.config.RefitConfig

class ProcessorFactory(private val config: RefitConfig) {

  def getGrafanaProcessors(schemaDao: SchemaDao,
                           grafanaDao: GrafanaDao) = new GrafanaProcessors(config, schemaDao, grafanaDao)

  def getPredictionProcessors(predictionDao: PredictionDao) = new PredictionProcessors(config, predictionDao)

  def getPulsarProcessors = new PulsarProcessors(config.getPulsarConfig())

  def getSchemaProcessors(dao: SchemaDao) = new SchemaProcessors(dao)

}