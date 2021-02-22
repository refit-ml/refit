package edu.cdl.iot.integrations.notebook.core.repository

import edu.cdl.iot.common.schema.DataSource
import edu.cdl.iot.integrations.notebook.core.error.NotebookStaticDataError
import edu.cdl.iot.protocol.StaticData.StaticData

trait NotebookStaticDataRepository {
  def save(dataSource: DataSource, staticData: StaticData): Either[Unit, NotebookStaticDataError]

  def find(dataSource: DataSource, key: String): Either[StaticData, NotebookStaticDataError]
}
