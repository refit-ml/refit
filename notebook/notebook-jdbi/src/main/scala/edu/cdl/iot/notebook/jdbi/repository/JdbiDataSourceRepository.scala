package edu.cdl.iot.notebook.jdbi.repository

import java.util.UUID

import edu.cdl.iot.common.schema.DataSource
import edu.cdl.iot.integrations.notebook.core.error.NotebookDataSourceError
import edu.cdl.iot.integrations.notebook.core.repository.NotebookDataSourceRepository
import edu.cdl.iot.notebook.jdbi.factory.TableNameFactory
import edu.cdl.iot.notebook.jdbi.factory.TableNameFactory.tableName
import org.jdbi.v3.core.Jdbi

class JdbiDataSourceRepository(val jdbi: Jdbi) extends NotebookDataSourceRepository {

 override def save(projectGuid: UUID, dataSource: DataSource): Either[Unit, NotebookDataSourceError] =
    Left(jdbi.useHandle(handle =>
      handle.execute(
        s"""
          create schema if not exists data_sources;
          create table if not exists data_sources.${tableName(projectGuid, dataSource)}
          (
              key        VARCHAR(255) NOT NULL,
              created_at timestamp NOT NULL DEFAULT current_timestamp,
              doubles    json         NOT NULL,
              strings    json         NOT NULL,
              integers   json         NOT NULL,
              timestamps json         NOT NULL,
              primary key (key)
          );
          """)
    ))

  override def delete(projectGuid: UUID, dataSource: DataSource): Either[Unit, NotebookDataSourceError] =
    Left(jdbi.useHandle(handle => handle.execute(s"drop table if exists data_sources.${tableName(projectGuid, dataSource)};")))
}
