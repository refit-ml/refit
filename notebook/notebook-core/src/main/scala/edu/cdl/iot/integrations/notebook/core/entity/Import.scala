package edu.cdl.iot.integrations.notebook.core.entity

import java.util.UUID

import edu.cdl.iot.protocol.Import.{Import => ImportEvelope}
import edu.cdl.iot.protocol.StaticDataImport.StaticDataImport

case class Import(var filePath: String,
                  var deleteWhenComplete: Boolean) {
  def this() = this(null, true)

  def getFilePath: String = filePath


  def getDeleteWhenComplete: Boolean = deleteWhenComplete

  def toProto(projectGuid: UUID) = new ImportEvelope(projectGuid.toString, filePath, deleteWhenComplete)

  def toStaticImportProto(projectGuid: UUID, dataSource: String) = new StaticDataImport(
    projectGuid = projectGuid.toString,
    dataSource = dataSource,
    filePath = filePath,
    deleteWhenComplete = deleteWhenComplete
  )

}

object FileImport {
  def of(request: ImportEvelope): Import = new Import(
    request.filePath,
    request.deleteWhenComplete
  )
}