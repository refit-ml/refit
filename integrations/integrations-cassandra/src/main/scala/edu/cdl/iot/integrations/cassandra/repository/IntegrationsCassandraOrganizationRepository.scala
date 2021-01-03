package edu.cdl.iot.integrations.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraOrganizationRepository
import edu.cdl.iot.integrations.core.repository.IntegrationsOrganizationRepository

class IntegrationsCassandraOrganizationRepository(cassandraRepository: CassandraRepository)
  extends CassandraOrganizationRepository(cassandraRepository) with IntegrationsOrganizationRepository

