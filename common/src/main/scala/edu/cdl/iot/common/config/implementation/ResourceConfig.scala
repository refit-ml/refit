package edu.cdl.iot.common.config.implementation

import java.io.InputStream

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.yaml.{CassandraConfig, ConfigYaml}
import org.yaml.snakeyaml.Yaml



class ResourceConfig(input: InputStream) extends RefitConfig {
  private val config = (new Yaml).loadAs(input, classOf[ConfigYaml])

  override val getPulsarHost: () => String = () => config.pulsarHost

  override val getEncryptionKey: () => String = () => config.encryptionKey

  override val getProject: () => String = () => config.project

  override val getCassandraConfig: () => CassandraConfig = () => config.cassandra
}