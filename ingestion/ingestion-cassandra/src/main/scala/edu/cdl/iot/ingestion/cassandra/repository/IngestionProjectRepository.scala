package edu.cdl.iot.ingestion.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraProjectRepository
import edu.cdl.iot.ingestion.core.repository.ProjectRepository

class IngestionProjectRepository(cassandraRepository: CassandraRepository)
  extends CassandraProjectRepository(cassandraRepository) with ProjectRepository
