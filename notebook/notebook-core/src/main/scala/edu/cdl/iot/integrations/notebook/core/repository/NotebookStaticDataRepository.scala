package edu.cdl.iot.integrations.notebook.core.repository

import java.util.UUID

import edu.cdl.iot.common.domain.StaticData
import edu.cdl.iot.common.schema.DataSource
import edu.cdl.iot.integrations.notebook.core.error.NotebookStaticDataError

trait NotebookStaticDataRepository {
  def save(projectGuid: UUID, dataSource: DataSource, staticData: StaticData): Unit

  def find(projectGuid: UUID, dataSource: DataSource, key: String): StaticData
}
