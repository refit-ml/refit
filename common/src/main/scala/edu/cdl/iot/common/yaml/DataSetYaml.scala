package edu.cdl.iot.common.yaml

import scala.beans.BeanProperty
import scala.collection.JavaConverters.seqAsJavaListConverter

class DataSetYaml(@BeanProperty var name: String,
                  @BeanProperty var fields: java.util.List[FieldYaml]) extends Serializable {
  def this() {
    this(null, List().asJava)
  }
}

