package edu.cdl.iot.ingestion.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraSensorRepository
import edu.cdl.iot.ingestion.core.repository.SensorRepository

class IngestionSensorRepository(cassandraRepository: CassandraRepository)
  extends CassandraSensorRepository(cassandraRepository) with SensorRepository