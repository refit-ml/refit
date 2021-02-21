package edu.cdl.iot.integrations.grafana.cassandra.repository

import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraSensorDataRepository
import edu.cdl.iot.integrations.grafana.core.repository.GrafanaSensorDataRepository

class GrafanaCassandraSensorDataRepository(cassandraRepository: CassandraRepository,
                                           decryptionHelper: String => EncryptionHelper = null)
extends CassandraSensorDataRepository(cassandraRepository, decryptionHelper) with GrafanaSensorDataRepository
