package edu.cdl.iot.notebook.jdbi.dependencies

import edu.cdl.iot.common.yaml.PostgresConfig
import edu.cdl.iot.data.postgres.factory.JdbiFactory
import edu.cdl.iot.notebook.jdbi.mapper.StaticDataMapper
import edu.cdl.iot.notebook.jdbi.repository.{JdbiDataSourceRepository, JdbiStaticDataRepository}

class NotebookJdbiDependencies(config: PostgresConfig) {
  private val jdbi = new JdbiFactory(config)
    .jdbi
    .registerRowMapper(new StaticDataMapper)

  val dataSourceRepository = new JdbiDataSourceRepository(jdbi)
  val staticDataRepository = new JdbiStaticDataRepository(jdbi)
}
