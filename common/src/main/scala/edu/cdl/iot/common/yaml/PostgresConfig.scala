package edu.cdl.iot.common.yaml

import scala.beans.BeanProperty

class PostgresConfig(@BeanProperty var schema: String,
                     @BeanProperty var host: String,
                     @BeanProperty var port: Int,
                     @BeanProperty var username: String,
                     @BeanProperty var password: String) extends Serializable {
  def this() {
    this(null, null, 5432, null, null)
  }
}
