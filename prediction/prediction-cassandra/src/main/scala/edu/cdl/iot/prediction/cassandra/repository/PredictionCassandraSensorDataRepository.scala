package edu.cdl.iot.prediction.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraPredictionRepository
import edu.cdl.iot.prediction.core.repository.PredictionSensorDataRepository

class PredictionCassandraSensorDataRepository(cassandraRepository: CassandraRepository)
  extends CassandraPredictionRepository(cassandraRepository) with PredictionSensorDataRepository