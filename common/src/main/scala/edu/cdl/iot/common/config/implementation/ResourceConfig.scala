package edu.cdl.iot.common.config.implementation

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.yaml.{CassandraConfig, ConfigYaml}
import org.yaml.snakeyaml.Yaml


class ResourceConfig() extends RefitConfig {
  private val fileName = "/development.yaml"
  private val fileStream = getClass.getResourceAsStream(fileName)
  private val config = (new Yaml).loadAs(fileStream, classOf[ConfigYaml])

  override val getPulsarHost: () => String = () => config.pulsarHost

  override val getEncryptionKey: () => String = () => config.encryptionKey

  override val getProject: () => String = () => config.project

  override val getCassandraConfig: () => CassandraConfig = () => config.cassandra
}