package edu.cdl.iot.ingestion.core.repository

import edu.cdl.iot.common.domain.Organization

trait OrganizationRepository {
  def createOrg(organization: Organization)
}
