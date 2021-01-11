package edu.cdl.iot.ingestion.core.service

import java.sql.Timestamp
import java.time.Instant

import edu.cdl.iot.common.domain.{Organization, Project}
import edu.cdl.iot.ingestion.core.dto.request.SchemaRequest
import edu.cdl.iot.ingestion.core.repository.{OrganizationRepository, ProjectRepository, SchemaRepository}

class ProjectService(organizationRepository: OrganizationRepository,
                     projectRepository: ProjectRepository,
                     schemaRepository: SchemaRepository) {

  def createProject(request: SchemaRequest): Unit = {
    val schema = schemaRepository.getSchema(request.path)
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

    organizationRepository.createOrg(organization)
    projectRepository.save(project)
  }
}
