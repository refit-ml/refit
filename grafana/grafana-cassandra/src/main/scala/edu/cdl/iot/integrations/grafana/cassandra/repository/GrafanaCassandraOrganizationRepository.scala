package edu.cdl.iot.integrations.grafana.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraOrganizationRepository
import edu.cdl.iot.integrations.grafana.core.repository.GrafanaOrganizationRepository

class GrafanaCassandraOrganizationRepository(cassandraRepository: CassandraRepository)
  extends CassandraOrganizationRepository(cassandraRepository) with GrafanaOrganizationRepository

