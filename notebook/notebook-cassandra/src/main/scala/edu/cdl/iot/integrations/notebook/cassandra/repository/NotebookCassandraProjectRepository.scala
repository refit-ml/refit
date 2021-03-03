package edu.cdl.iot.integrations.notebook.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraProjectRepository
import edu.cdl.iot.integrations.notebook.core.repository.NotebookProjectRepository

class NotebookCassandraProjectRepository(cassandraRepository: CassandraRepository)
  extends CassandraProjectRepository(cassandraRepository) with NotebookProjectRepository
