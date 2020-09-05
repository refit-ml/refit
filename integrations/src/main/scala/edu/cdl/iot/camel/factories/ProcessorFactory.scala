package edu.cdl.iot.camel.factories

import edu.cdl.iot.camel.dao.CassandraDao
import edu.cdl.iot.camel.transform.{CassandraProcessors, GrafanaProcessors, PulsarProcessors, SchemaProcessors}
import edu.cdl.iot.common.config.RefitConfig

class ProcessorFactory(private val config: RefitConfig) {

  def getCassandraProcessors(dao: CassandraDao) = new CassandraProcessors(dao, config)

  def getGrafanaProcessors(dao: CassandraDao) = new GrafanaProcessors(dao)

  def getPulsarProcessors = new PulsarProcessors(config)

  def getSchemaProcessors(dao: CassandraDao) = new SchemaProcessors(dao)
}
