package edu.cdl.iot.ingestion.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraOrganizationRepository
import edu.cdl.iot.ingestion.core.repository.OrganizationRepository

class IngestionOrganizationRepository(cassandraRepository: CassandraRepository) extends
  CassandraOrganizationRepository(cassandraRepository) with OrganizationRepository
