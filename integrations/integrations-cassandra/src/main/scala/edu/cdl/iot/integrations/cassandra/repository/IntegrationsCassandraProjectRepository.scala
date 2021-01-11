package edu.cdl.iot.integrations.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraProjectRepository
import edu.cdl.iot.integrations.core.repository.IntegrationsProjectRepository

class IntegrationsCassandraProjectRepository(cassandraRepository: CassandraRepository)
  extends CassandraProjectRepository(cassandraRepository) with IntegrationsProjectRepository
