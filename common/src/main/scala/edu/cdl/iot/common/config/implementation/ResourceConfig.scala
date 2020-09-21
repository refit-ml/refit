package edu.cdl.iot.common.config.implementation

import java.io.InputStream

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.yaml.{CassandraConfig, ConfigYaml, MinioConfig, PulsarConfig}
import org.yaml.snakeyaml.Yaml


class ResourceConfig(input: InputStream) extends RefitConfig {
  private val config = (new Yaml).loadAs(input, classOf[ConfigYaml])

  override val getPulsarConfig: () => PulsarConfig = () => config.pulsar

  override val getEncryptionKey: () => String = () => config.encryptionKey

  override val getProject: () => String = () => config.project

  override val getCassandraConfig: () => CassandraConfig = () => config.cassandra

  override val getMinioConfig: () => MinioConfig = () => config.minio

  override val runDemo: () => Boolean = () => config.demo
}