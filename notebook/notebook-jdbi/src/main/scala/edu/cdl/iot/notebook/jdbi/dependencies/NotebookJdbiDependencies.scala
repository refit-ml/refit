package edu.cdl.iot.notebook.jdbi.dependencies


import edu.cdl.iot.notebook.jdbi.mapper.StaticDataMapper
import edu.cdl.iot.notebook.jdbi.repository.{JdbiDataSourceRepository, JdbiStaticDataRepository}
import org.jdbi.v3.core.Jdbi

class NotebookJdbiDependencies(jdbi: Jdbi) {

  jdbi.registerRowMapper(new StaticDataMapper)

  val dataSourceRepository = new JdbiDataSourceRepository(jdbi)
  val staticDataRepository = new JdbiStaticDataRepository(jdbi)
}
