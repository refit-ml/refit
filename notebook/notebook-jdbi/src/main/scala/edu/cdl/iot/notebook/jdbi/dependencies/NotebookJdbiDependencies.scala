package edu.cdl.iot.notebook.jdbi.dependencies


import edu.cdl.iot.data.postgres.repository.JdbiStaticDataRepository
import edu.cdl.iot.notebook.jdbi.repository.JdbiDataSourceRepository
import org.jdbi.v3.core.Jdbi

class NotebookJdbiDependencies(jdbi: Jdbi) {

  val dataSourceRepository = new JdbiDataSourceRepository(jdbi)
  val staticDataRepository = new JdbiStaticDataRepository(jdbi)
}
