package edu.cdl.iot.integrations.grafana.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraProjectRepository
import edu.cdl.iot.integrations.grafana.core.repository.GrafanaProjectRepository

class GrafanaCassandraProjectRepository(cassandraRepository: CassandraRepository)
  extends CassandraProjectRepository(cassandraRepository) with GrafanaProjectRepository
