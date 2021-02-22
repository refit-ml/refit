package edu.cdl.iot.integrations.notebook.core.repository

import java.util.UUID

import edu.cdl.iot.common.schema.DataSource
import edu.cdl.iot.integrations.notebook.core.error.NotebookDataSourceError

trait NotebookDataSourceRepository {
  def save(projectGuid: UUID, dataSource: DataSource): Either[Unit, NotebookDataSourceError]

  def delete(projectGuid: UUID, dataSource: DataSource): Either[Unit, NotebookDataSourceError]
}
