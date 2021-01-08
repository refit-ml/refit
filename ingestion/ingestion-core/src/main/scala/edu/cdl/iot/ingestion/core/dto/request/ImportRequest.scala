package edu.cdl.iot.ingestion.core.dto.request

import edu.cdl.iot.protocol.ImportRequest.{ImportRequest => ImportEvelope}

class ImportRequest(var projectGuid: String,
                    var filePath: String,
                    var importType: String,
                    var deleteWhenComplete: Boolean) {
  def this() = this(null, null, null, true)

  def getFilePath: String = filePath

  def getProjectGuid: String = projectGuid

  def getDeleteWhenComplete: Boolean = deleteWhenComplete

  def envelope = new ImportEvelope(projectGuid, filePath, deleteWhenComplete, importTrainingWindow)

  def getImportType: String = importType

  def importTrainingWindow: Boolean = importType.toLowerCase == "training_window"


}

object ImportRequest {
  def of(request: ImportEvelope): ImportRequest = new ImportRequest(
    request.projectGuid,
    request.filePath,
    if (request.importTrainingWindow) "training_window" else "sensor_data",
    request.deleteWhenComplete
  )
}