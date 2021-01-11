package edu.cdl.iot.ingestion.core.repository

import edu.cdl.iot.protocol.ImportRequest.ImportRequest

trait ImportRepository {
  def saveImportRequest(importRequest: ImportRequest): Unit
}
