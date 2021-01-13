package edu.cdl.iot.integrations.notebook.core.entity.request

import java.util.UUID

import edu.cdl.iot.protocol.ImportRequest.{ImportRequest => ImportEvelope}

case class ImportRequest(var filePath: String,
                         var importType: String,
                         var deleteWhenComplete: Boolean) {
  def this() = this(null, null, true)

  def getFilePath: String = filePath


  def getDeleteWhenComplete: Boolean = deleteWhenComplete

  def envelope(projectGuid: UUID) = new ImportEvelope(projectGuid.toString, filePath, deleteWhenComplete, importTrainingWindow)

  def getImportType: String = importType

  def importTrainingWindow: Boolean = importType.toLowerCase == "training_window"


}

object ImportRequest {
  def of(request: ImportEvelope): ImportRequest = new ImportRequest(
    request.filePath,
    if (request.importTrainingWindow) "training_window" else "sensor_data",
    request.deleteWhenComplete
  )
}