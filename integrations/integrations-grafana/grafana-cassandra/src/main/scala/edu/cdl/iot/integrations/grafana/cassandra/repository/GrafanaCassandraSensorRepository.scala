package edu.cdl.iot.integrations.grafana.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraSensorRepository
import edu.cdl.iot.integrations.grafana.core.repository.GrafanaSensorRepository

class GrafanaCassandraSensorRepository(cassandraRepository: CassandraRepository)
extends CassandraSensorRepository(cassandraRepository) with GrafanaSensorRepository
