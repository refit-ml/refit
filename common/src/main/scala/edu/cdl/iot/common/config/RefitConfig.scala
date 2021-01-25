package edu.cdl.iot.common.config

import edu.cdl.iot.common.yaml.{CassandraConfig, KafkaConfig, MinioConfig, PostgresConfig}

trait RefitConfig {

  val getKafkaConfig: () => KafkaConfig

  val getCassandraConfig: () => CassandraConfig

  val getMinioConfig: () => MinioConfig

  val getPostgresConfig: () => PostgresConfig

  val getEncryptionKey: () => String

  val getProject: () => String

  val runDemo: () => Boolean

}