package edu.cdl.iot.common.yaml

import scala.beans.BeanProperty

class CassandraConfig(@BeanProperty var keyspace: String,
                      @BeanProperty var host: String,
                      @BeanProperty var port: Int,
                      @BeanProperty var user: String,
                      @BeanProperty var password: String) extends Serializable {
  def this() {
    this(null, null, 9042, null, null)
  }
}
