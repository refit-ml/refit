package edu.cdl.iot.common.config

import edu.cdl.iot.common.yaml.{CassandraConfig, PulsarConfig}

trait RefitConfig {

  val getPulsarConfig: () => PulsarConfig

  val getCassandraConfig: () => CassandraConfig

  val getEncryptionKey: () => String

  val getProject: () => String

  val runDemo: () => Boolean

}