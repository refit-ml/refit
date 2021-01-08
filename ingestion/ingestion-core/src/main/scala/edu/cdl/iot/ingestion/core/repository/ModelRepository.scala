package edu.cdl.iot.ingestion.core.repository

import edu.cdl.iot.protocol.Model.Model

trait ModelRepository {
  def saveModel(model: Model)
}
