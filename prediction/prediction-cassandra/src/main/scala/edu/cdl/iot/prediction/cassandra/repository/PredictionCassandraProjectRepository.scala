package edu.cdl.iot.prediction.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraProjectRepository
import edu.cdl.iot.prediction.core.repository.PredictionProjectRepository

class PredictionCassandraProjectRepository(cassandraRepository: CassandraRepository)
  extends CassandraProjectRepository(cassandraRepository) with PredictionProjectRepository
