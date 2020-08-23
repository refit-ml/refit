package edu.cdl.iot.common.schema.yaml

import java.util.UUID

import scala.beans.BeanProperty

import collection.JavaConverters._

class SchemaYaml(@BeanProperty var name: String,
                 @BeanProperty var projectGuid: UUID,
                 @BeanProperty var partitionScheme: String,
                 @BeanProperty var fields: java.util.List[FieldYaml],
                 @BeanProperty var importOptions: ImportOptionsYaml) extends Serializable {
  def this() {
    this(null, null, null, List().asJava, null)
  }
}
