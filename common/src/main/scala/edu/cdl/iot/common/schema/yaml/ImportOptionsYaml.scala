package edu.cdl.iot.common.schema.yaml

import scala.beans.BeanProperty

class ImportOptionsYaml extends Serializable {
  @BeanProperty var fileName: String = _
  @BeanProperty var includesHeader: Boolean = false
}
