package edu.cdl.iot.ingestion.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraTrainingWindowRepository
import edu.cdl.iot.ingestion.core.repository.TrainingWindowRepository

class IngestionTrainingWindowRepository(cassandraRepository: CassandraRepository)
  extends CassandraTrainingWindowRepository(cassandraRepository) with TrainingWindowRepository
