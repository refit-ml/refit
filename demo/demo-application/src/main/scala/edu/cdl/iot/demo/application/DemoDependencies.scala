package edu.cdl.iot.demo.application

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.demo.cassandra.DemoSchemaRepository
import edu.cdl.iot.demo.core.DemoService
import org.apache.camel.CamelContext

class DemoDependencies(config: RefitConfig, context: CamelContext) {

  private val cassandraRepository = new CassandraRepository(config.getCassandraConfig())
  private val schemaRepository = new DemoSchemaRepository(cassandraRepository)

  private val demoService = new DemoService(schemaRepository)
  val demoRoutes = new DemoRoutes(
    kafkaConfig = config.getKafkaConfig(),
    demoService = demoService,
    context = context
  )
}
