package edu.cdl.iot.integrations.notebook.core.repository

import edu.cdl.iot.common.domain.Organization

trait NotebookOrganizationRepository {
  def save(organization: Organization)
}
