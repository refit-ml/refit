package edu.cdl.iot.integrations.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraTrainingWindowRepository
import edu.cdl.iot.integrations.core.repository.IntegrationsTrainingWindowRepository

class IntegrationsCassandraTrainingWindowRepository(cassandraRepository: CassandraRepository)
  extends CassandraTrainingWindowRepository(cassandraRepository) with IntegrationsTrainingWindowRepository
