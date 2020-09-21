package edu.cdl.iot.common.yaml

import scala.beans.BeanProperty

class PulsarConfig(@BeanProperty var host: String,
                   @BeanProperty var topics: PulsarTopic) extends Serializable {
  def this() {
    this(null, null)
  }
}

class PulsarTopic(@BeanProperty var models: String,
                  @BeanProperty var data: String,
                  @BeanProperty var predictions: String,
                  @BeanProperty var `import`: String,
                  @BeanProperty var publishModels: String) extends Serializable {
  def this() {
    this(null, null, null, null, null)
  }
}