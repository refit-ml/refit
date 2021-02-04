package edu.cdl.iot.prediction.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraSensorRepository
import edu.cdl.iot.prediction.core.repository.PredictionSensorRepository

class PredictionCassandraSensorRepository(cassandraRepository: CassandraRepository)
extends CassandraSensorRepository(cassandraRepository) with PredictionSensorRepository
