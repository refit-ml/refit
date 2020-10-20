package edu.cdl.iot.integrations.factories

import edu.cdl.iot.integrations.dao.{GrafanaDao, PredictionDao, SchemaDao}
import edu.cdl.iot.integrations.transform.{GrafanaProcessors, PredictionProcessors, SchemaProcessors}
import edu.cdl.iot.common.config.RefitConfig

class ProcessorFactory(private val config: RefitConfig) {

  def getGrafanaProcessors(schemaDao: SchemaDao,
                           grafanaDao: GrafanaDao) = new GrafanaProcessors(config, schemaDao, grafanaDao)

  def getPredictionProcessors(predictionDao: PredictionDao) = new PredictionProcessors(config, predictionDao)


  def getSchemaProcessors(dao: SchemaDao) = new SchemaProcessors(dao)

}