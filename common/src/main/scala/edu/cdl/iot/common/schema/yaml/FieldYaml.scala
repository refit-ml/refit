package edu.cdl.iot.common.schema.yaml

import scala.beans.BeanProperty

class FieldYaml extends Serializable {
  @BeanProperty var name: String = _
  @BeanProperty var `type`: String = _
  @BeanProperty var classification: String = _
}
