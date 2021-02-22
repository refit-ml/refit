package edu.cdl.iot.integrations.notebook.core.repository

import edu.cdl.iot.common.schema.DataSource
import edu.cdl.iot.integrations.notebook.core.error.NotebookDataSourceError

trait NotebookDataSourceRepository {
  def save(dataSource: DataSource): Either[Unit, NotebookDataSourceError]

  def delete(dataSource: DataSource): Either[Unit, NotebookDataSourceError]
}
