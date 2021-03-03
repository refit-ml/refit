package edu.cdl.iot.integrations.notebook.cassandra.repository

import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.cassandra.repository.CassandraSensorRepository
import edu.cdl.iot.integrations.notebook.core.repository.NotebookSensorRepository

class NotebookCassandraSensorRepository(cassandraRepository: CassandraRepository)
extends CassandraSensorRepository(cassandraRepository) with NotebookSensorRepository
