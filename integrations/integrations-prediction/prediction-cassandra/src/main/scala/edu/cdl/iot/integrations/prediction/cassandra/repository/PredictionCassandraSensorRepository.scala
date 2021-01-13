package edu.cdl.iot.integrations.prediction.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraSensorRepository
import edu.cdl.iot.integrations.prediction.core.repository.PredictionSensorRepository

class PredictionCassandraSensorRepository(cassandraRepository: CassandraRepository)
extends CassandraSensorRepository(cassandraRepository) with PredictionSensorRepository
