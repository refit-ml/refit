package edu.cdl.iot.common.config

import edu.cdl.iot.common.yaml.CassandraConfig

trait RefitConfig {

  val getPulsarHost: () => String

  val getCassandraConfig: () => CassandraConfig

  val getEncryptionKey: () => String

  val getProject: () => String

  val runDemo: () => Boolean

}