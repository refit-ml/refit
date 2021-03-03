package edu.cdl.iot.notebook.jdbi.repository

import java.util.UUID

import com.fasterxml.jackson.databind.ObjectMapper
import edu.cdl.iot.common.domain.StaticData
import edu.cdl.iot.common.schema.DataSource
import edu.cdl.iot.data.postgres.repository.JdbiStaticDataRepository
import edu.cdl.iot.integrations.notebook.core.error.NotebookStaticDataError
import edu.cdl.iot.integrations.notebook.core.repository.NotebookStaticDataRepository
import edu.cdl.iot.notebook.jdbi.factory.TableNameFactory.tableName
import org.jdbi.v3.core.Jdbi

import scala.collection.JavaConverters.mapAsJavaMapConverter

class NotebookJdbiStaticDataRepository(jdbi: Jdbi)
  extends JdbiStaticDataRepository(jdbi)
    with NotebookStaticDataRepository
