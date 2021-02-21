package edu.cdl.iot.common.yaml

import scala.beans.BeanProperty
import scala.collection.JavaConverters._

class SchemaYaml(@BeanProperty var org: String,
                 @BeanProperty var orgGuid: String,
                 @BeanProperty var name: String,
                 @BeanProperty var projectGuid: String,
                 @BeanProperty var partitionScheme: String,
                 @BeanProperty var featureType: String,
                 @BeanProperty var fields: java.util.List[FieldYaml],
                 @BeanProperty var dataSets: java.util.List[DataSetYaml],
                 @BeanProperty var importOptions: ImportOptionsYaml) extends Serializable {
  def this() {
    this(null, null, null, null, null, null, List().asJava, List().asJava, null)
  }
}
