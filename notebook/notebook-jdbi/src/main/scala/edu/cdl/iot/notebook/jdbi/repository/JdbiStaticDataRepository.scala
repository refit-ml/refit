package edu.cdl.iot.notebook.jdbi.repository

import java.util.UUID

import com.fasterxml.jackson.databind.ObjectMapper
import edu.cdl.iot.common.domain.StaticData
import edu.cdl.iot.common.schema.DataSource
import edu.cdl.iot.integrations.notebook.core.error.NotebookStaticDataError
import edu.cdl.iot.integrations.notebook.core.repository.NotebookStaticDataRepository
import edu.cdl.iot.notebook.jdbi.factory.TableNameFactory.tableName
import org.jdbi.v3.core.Jdbi

import scala.collection.JavaConverters.mapAsJavaMapConverter

class JdbiStaticDataRepository(jdbi: Jdbi) extends NotebookStaticDataRepository {
  private val mapper = new ObjectMapper()

  def save(projectGuid: UUID, dataSource: DataSource, staticData: StaticData): Either[Unit, NotebookStaticDataError] = {
    Left(jdbi.useHandle(handle =>
      handle.createUpdate(
        s"""insert into data_sources.${tableName(projectGuid, dataSource)} (key, doubles, strings, integers, timestamps)
              values (:key, :doubles, :strings, :integers, :timestamps);""")
        .bind("key", staticData.key)
        .bind("doubles", mapper.writeValueAsString(staticData.doubles.asJava))
        .bind("strings", mapper.writeValueAsString(staticData.strings.asJava))
        .bind("integers", mapper.writeValueAsString(staticData.integers.asJava))
        .bind("timestamps", mapper.writeValueAsString(staticData.timestamps.asJava))
        .execute()
    ))
  }

  def find(projectGuid: UUID, dataSource: DataSource, key: String): Either[StaticData, NotebookStaticDataError] = {
    Left(jdbi.withHandle(handle =>
      handle.createQuery(
        s"""select :project_guid project_guid, key, created_at, doubles, strings, integers, timestamps
               from data_sources.${tableName(projectGuid, dataSource)}
               where key = :key
               """)
        .bind("key", key)
        .bind("project_guid", projectGuid)
        .mapTo(classOf[StaticData])
        .one()
    ))
  }
}
