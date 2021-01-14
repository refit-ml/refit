package edu.cdl.iot.integrations.notebook.core.entity

import java.util.UUID

import edu.cdl.iot.protocol.ImportRequest.{ImportRequest => ImportEvelope}

case class FileImport(var filePath: String,
                      var importType: String,
                      var deleteWhenComplete: Boolean) {
  def this() = this(null, null, true)

  def getFilePath: String = filePath


  def getDeleteWhenComplete: Boolean = deleteWhenComplete

  def envelope(projectGuid: UUID) = new ImportEvelope(projectGuid.toString, filePath, deleteWhenComplete, importTrainingWindow)

  def getImportType: String = importType

  def importTrainingWindow: Boolean = importType.toLowerCase == "training_window"


}

object FileImport {
  def of(request: ImportEvelope): FileImport = new FileImport(
    request.filePath,
    if (request.importTrainingWindow) "training_window" else "sensor_data",
    request.deleteWhenComplete
  )
}