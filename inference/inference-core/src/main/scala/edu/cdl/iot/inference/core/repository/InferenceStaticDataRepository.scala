package edu.cdl.iot.inference.core.repository

import java.util.UUID

import edu.cdl.iot.common.domain.StaticData
import edu.cdl.iot.common.schema.DataSource

trait InferenceStaticDataRepository {
  def find(projectGuid: UUID, dataSource: DataSource, key: String): StaticData
}
