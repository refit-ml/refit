package edu.cdl.iot.common.yaml

import scala.beans.BeanProperty

class MinioConfig(@BeanProperty var host: String,
                  @BeanProperty var accessKey: String,
                  @BeanProperty var secretKey: String,
                  @BeanProperty var buckets: MinioBucket) extends Serializable {
  def this() {
    this(null, null, null, null)
  }
}

class MinioBucket(@BeanProperty var `import`: String,
                  @BeanProperty var models: String) extends Serializable {
  def this() {
    this(null, null)
  }
}