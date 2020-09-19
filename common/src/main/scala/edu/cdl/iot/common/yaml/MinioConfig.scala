package edu.cdl.iot.common.yaml

import scala.beans.BeanProperty

class MinioConfig(@BeanProperty var accessKey: String,
                  @BeanProperty var secretKey: String,
                  @BeanProperty var buckets: MinioBucket) extends Serializable {
  def this() {
    this(null, null, null)
  }
}

class MinioBucket(@BeanProperty var `import`: String) extends Serializable {
  def this() {
    this(null)
  }
}