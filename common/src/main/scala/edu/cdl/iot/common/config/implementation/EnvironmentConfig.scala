package edu.cdl.iot.common.config.implementation

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.constants.EnvConstants
import edu.cdl.iot.common.yaml.{CassandraConfig, PulsarConfig, PulsarTopic}


class EnvironmentConfig extends RefitConfig {

  override val getPulsarConfig: () => PulsarConfig = () => new PulsarConfig(
    sys.env(EnvConstants.PULSAR_HOST),
    new PulsarTopic(
      sys.env(EnvConstants.MODELS_TOPIC),
      sys.env(EnvConstants.DATA_TOPIC),
      sys.env(EnvConstants.PREDICTIONS_TOPIC),
      sys.env(EnvConstants.IMPORT_TOPIC),
      sys.env(EnvConstants.MODEL_PUBLISH_TOPIC)
    )
  )

  override val getEncryptionKey: () => String = () => sys.env(EnvConstants.ENCRYPTION_KEY)


  override val getProject: () => String = () => sys.env(EnvConstants.PROJECT)
  override val getCassandraConfig: () => CassandraConfig = () => new CassandraConfig(
    sys.env(EnvConstants.CASSANDRA_KEYSPACE),
    sys.env(EnvConstants.CASSANDRA_HOST),
    sys.env(EnvConstants.CASSANDRA_PORT).toInt,
    sys.env(EnvConstants.CASSANDRA_USER),
    sys.env(EnvConstants.CASSANDRA_PASSWORD)
  )
  override val runDemo: () => Boolean = () => sys.env(EnvConstants.DEMO).toBoolean
}
