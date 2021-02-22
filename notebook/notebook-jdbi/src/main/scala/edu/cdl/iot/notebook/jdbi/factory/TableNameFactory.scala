package edu.cdl.iot.notebook.jdbi.factory

import java.util.UUID

import edu.cdl.iot.common.schema.DataSource

object TableNameFactory {
  def tableName(projectGuid: UUID, dataSource: DataSource) =
    s"refit_static_${projectGuid.toString.replace('-', '_')}_${dataSource.name.replaceAll("[^a-zA-Z]", "").toLowerCase()}"


}
