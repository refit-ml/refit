package edu.cdl.iot.integrations.notebook.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraTrainingWindowRepository
import edu.cdl.iot.integrations.notebook.core.repository.NotebookTrainingWindowRepository

class NotebookCassandraTrainingWindowRepository(cassandraRepository: CassandraRepository)
  extends CassandraTrainingWindowRepository(cassandraRepository)
    with NotebookTrainingWindowRepository

