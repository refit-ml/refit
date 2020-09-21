package edu.cdl.iot.ingestion.dto.request

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import edu.cdl.iot.protocol.ImportRequest.{ImportRequest => ImportEvelope}

@JsonIgnoreProperties(ignoreUnknown = true)
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