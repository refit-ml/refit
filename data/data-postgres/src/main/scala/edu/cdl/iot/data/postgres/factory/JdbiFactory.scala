package edu.cdl.iot.data.postgres.factory

import edu.cdl.iot.common.yaml.PostgresConfig
import org.jdbi.v3.core.Jdbi
import org.jdbi.v3.jackson2.Jackson2Plugin
import org.jdbi.v3.postgres.PostgresPlugin
import org.jdbi.v3.sqlobject.SqlObjectPlugin

class JdbiFactory(config: PostgresConfig) {
  def jdbi: Jdbi =
    Jdbi.create(
      s"jdbc:postgresql://${config.host}:${config.port}/${config.schema}?stringtype=unspecified",
      config.username,
      config.password
    ).installPlugin(new PostgresPlugin())
      .installPlugin(new SqlObjectPlugin())
      .installPlugin(new Jackson2Plugin())
}
