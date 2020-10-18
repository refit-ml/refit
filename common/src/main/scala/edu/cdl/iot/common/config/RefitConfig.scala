package edu.cdl.iot.common.config

import edu.cdl.iot.common.yaml.{CassandraConfig, KafkaConfig, MinioConfig, PulsarConfig}

trait RefitConfig {

  val getPulsarConfig: () => PulsarConfig

  val getKafkaConfig: () => KafkaConfig

  val getCassandraConfig: () => CassandraConfig

  val getMinioConfig: () => MinioConfig

  val getEncryptionKey: () => String

  val getProject: () => String

  val runDemo: () => Boolean

}