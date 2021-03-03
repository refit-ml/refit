package edu.cdl.iot.integrations.notebook.core.service

import java.sql.Timestamp
import java.time.Instant
import java.util.UUID

import edu.cdl.iot.common.domain.{Organization, Project}
import edu.cdl.iot.integrations.notebook.core.entity.SchemaImport
import edu.cdl.iot.integrations.notebook.core.repository.{NotebookDataSourceRepository, NotebookOrganizationRepository, NotebookProjectRepository, NotebookSchemaRepository}
import org.slf4j.LoggerFactory

class NotebookProjectService(projectRepository: NotebookProjectRepository,
                             schemaRepository: NotebookSchemaRepository,
                             organizationRepository: NotebookOrganizationRepository,
                             dataSourceRepository: NotebookDataSourceRepository) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookProjectService])

  def project(projectGuid: UUID): Project =
    projectRepository.find(projectGuid)

  def createProject(request: SchemaImport): Unit = {
    val schema = schemaRepository.findByPath(request.path)
    val organization = Organization(
      orgGuid = schema.orgGuid,
      timestamp = Timestamp.from(Instant.now()),
      name = schema.org
    )

    val project = Project(
      orgGuid = schema.orgGuid,
      projectGuid = schema.projectGuid,
      modelGuid = null,
      name = schema.name,
      description = "",
      timestamp = Timestamp.from(Instant.now()),
      schema = schema
    )

    organizationRepository.save(organization)
    projectRepository.save(project)
    schema.dataSources.foreach(dataSourceRepository.save(schema.projectGuid, _))
  }


}
