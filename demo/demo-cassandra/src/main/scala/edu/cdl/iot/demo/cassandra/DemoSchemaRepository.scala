package edu.cdl.iot.demo.cassandra

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraProjectRepository
import edu.cdl.iot.demo.core.repository.SchemaRepository

class DemoSchemaRepository(cassandraRepository: CassandraRepository)
  extends CassandraProjectRepository(cassandraRepository) with SchemaRepository
