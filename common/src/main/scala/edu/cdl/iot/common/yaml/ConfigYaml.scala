package edu.cdl.iot.common.yaml

import scala.beans.BeanProperty

class ConfigYaml(@BeanProperty var pulsarHost: String,
                 @BeanProperty var cassandra: CassandraConfig,
                 @BeanProperty var encryptionKey: String,
                 @BeanProperty var project: String) extends Serializable {
  def this() {
    this(null, null, null, null)
  }
}
