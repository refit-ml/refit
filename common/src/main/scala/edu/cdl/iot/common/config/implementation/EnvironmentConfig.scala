package edu.cdl.iot.common.config.implementation

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.constants.EnvConstants
import edu.cdl.iot.common.yaml.{CassandraConfig, KafkaConfig, KafkaTopic, MinioBucket, MinioConfig}


class EnvironmentConfig extends RefitConfig {

  override val getKafkaConfig: () => KafkaConfig = () => new KafkaConfig(
    sys.env(EnvConstants.KAFKA_HOST),
    new KafkaTopic(
      sys.env(EnvConstants.MODELS_TOPIC),
      sys.env(EnvConstants.DATA_TOPIC),
      sys.env(EnvConstants.PREDICTIONS_TOPIC),
      sys.env(EnvConstants.IMPORT_TOPIC)
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
  override val getMinioConfig: () => MinioConfig = () => new MinioConfig(
    sys.env(EnvConstants.MINIO_HOST),
    sys.env(EnvConstants.MINIO_ACCESS_KEY),
    sys.env(EnvConstants.MINIO_SECRET_KEY),
    new MinioBucket(
      sys.env(EnvConstants.MINIO_BUCKET_IMPORT),
      sys.env(EnvConstants.MINIO_BUCKET_MODELS),
      sys.env(EnvConstants.MINIO_BUCKET_SCHEMA)
    )
  )
}
