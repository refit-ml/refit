package edu.cdl.iot.common.yaml

import scala.beans.BeanProperty

class ConfigYaml(@BeanProperty var kafka: KafkaConfig,
                 @BeanProperty var cassandra: CassandraConfig,
                 @BeanProperty var minio: MinioConfig,
                 @BeanProperty var encryptionKey: String,
                 @BeanProperty var project: String,
                 @BeanProperty var demo: Boolean) extends Serializable {
  def this() {
    this(null, null, null, null, null, false)
  }
}
