package edu.cdl.iot.common.config.implementation

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.constants.EnvConstants
import edu.cdl.iot.common.yaml.{CassandraConfig, KafkaConfig, KafkaTopic, MinioBucket, MinioConfig}


class EnvironmentConfig extends RefitConfig {

  override val getKafkaConfig: () => KafkaConfig = () => new KafkaConfig(
    sys.env(EnvConstants.KAFKA_HOST),
    new KafkaTopic(
      modelPublished = sys.env(EnvConstants.MODEL_PUBLISHED_TOPIC),
      data = sys.env(EnvConstants.DATA_TOPIC),
      predictions = sys.env(EnvConstants.PREDICTIONS_TOPIC),
      `import` = sys.env(EnvConstants.IMPORT_TOPIC),
      rawSensorData = sys.env(EnvConstants.RAW_SENSOR_DATA_TOPIC),
      sensorData = sys.env(EnvConstants.SENSOR_DATA_TOPIC)
    )
  )

  override val getEncryptionKey: () => String = () => sys.env(EnvConstants.ENCRYPTION_KEY)


  override val getProject: () => String = () => sys.env(EnvConstants.PROJECT)
  override val getCassandraConfig: () => CassandraConfig = () => new CassandraConfig(
    keyspace = sys.env(EnvConstants.CASSANDRA_KEYSPACE),
    host = sys.env(EnvConstants.CASSANDRA_HOST),
    port = sys.env(EnvConstants.CASSANDRA_PORT).toInt,
    user = sys.env(EnvConstants.CASSANDRA_USER),
    password = sys.env(EnvConstants.CASSANDRA_PASSWORD)
  )
  override val runDemo: () => Boolean = () => sys.env(EnvConstants.DEMO).toBoolean
  override val getMinioConfig: () => MinioConfig = () => new MinioConfig(
    host = sys.env(EnvConstants.MINIO_HOST),
    accessKey = sys.env(EnvConstants.MINIO_ACCESS_KEY),
    secretKey = sys.env(EnvConstants.MINIO_SECRET_KEY),
    new MinioBucket(
      `import` = sys.env(EnvConstants.MINIO_BUCKET_IMPORT),
      models = sys.env(EnvConstants.MINIO_BUCKET_MODELS),
      schema = sys.env(EnvConstants.MINIO_BUCKET_SCHEMA)
    )
  )
}
