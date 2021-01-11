package edu.cdl.iot.integrations.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraSensorRepository
import edu.cdl.iot.integrations.core.repository.IntegrationsSensorRepository

class IntegrationsCassandraSensorRepository(cassandraRepository: CassandraRepository)
extends CassandraSensorRepository(cassandraRepository) with IntegrationsSensorRepository
