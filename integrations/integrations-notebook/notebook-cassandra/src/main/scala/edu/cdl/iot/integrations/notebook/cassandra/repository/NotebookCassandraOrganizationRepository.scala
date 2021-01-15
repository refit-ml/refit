package edu.cdl.iot.integrations.notebook.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraOrganizationRepository
import edu.cdl.iot.integrations.notebook.core.repository.NotebookOrganizationRepository

class NotebookCassandraOrganizationRepository(cassandraRepository: CassandraRepository)
  extends CassandraOrganizationRepository(cassandraRepository)
    with NotebookOrganizationRepository
