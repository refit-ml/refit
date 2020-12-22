package edu.cdl.iot.common.config.implementation

import java.io.InputStream

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.yaml.{CassandraConfig, ConfigYaml, KafkaConfig, MinioConfig}
import org.yaml.snakeyaml.Yaml


class ResourceConfig(input: InputStream) extends RefitConfig {
  private val config = (new Yaml).loadAs(input, classOf[ConfigYaml])

  override val getKafkaConfig: () => KafkaConfig = () => config.kafka

  override val getEncryptionKey: () => String = () => config.encryptionKey

  override val getProject: () => String = () => config.project

  override val getCassandraConfig: () => CassandraConfig = () => config.cassandra

  override val getMinioConfig: () => MinioConfig = () => config.minio

  override val runDemo: () => Boolean = () => config.demo
}