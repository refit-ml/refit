package edu.cdl.iot.integrations.cassandra.repository

import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraSensorDataRepository
import edu.cdl.iot.integrations.core.repository.IntegrationsSensorDataRepository

class IntegrationsCassandraSensorDataRepository(cassandraRepository: CassandraRepository,
                                                decryptionHelper: String => EncryptionHelper = null)
extends CassandraSensorDataRepository(cassandraRepository, decryptionHelper) with IntegrationsSensorDataRepository
