package edu.cdl.iot.common.config.implementation

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.constants.EnvConstants
import edu.cdl.iot.common.yaml.CassandraConfig


class EnvironmentConfig extends RefitConfig {

  override val getPulsarHost: () => String = () => sys.env(EnvConstants.PULSAR_HOST)

  override val getEncryptionKey: () => String = () => sys.env(EnvConstants.ENCRYPTION_KEY)


  override val getProject: () => String = () => sys.env(EnvConstants.PROJECT)
  override val getCassandraConfig: () => CassandraConfig = () => new CassandraConfig(
    sys.env(EnvConstants.CASSANDRA_KEYSPACE),
    sys.env(EnvConstants.CASSANDRA_HOST),
    sys.env(EnvConstants.CASSANDRA_PORT).toInt,
    sys.env(EnvConstants.CASSANDRA_USER),
    sys.env(EnvConstants.CASSANDRA_PASSWORD)
  )
}
