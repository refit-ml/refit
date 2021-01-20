package edu.cdl.iot.integrations.notebook.core.repository

import edu.cdl.iot.protocol.Model.Model

trait NotebookModelRepository {
  def save(model: Model): Unit
}
