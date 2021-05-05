package edu.cdl.iot.integrations.notebook.core.service

import com.fasterxml.jackson.databind.json.JsonMapper
import com.fasterxml.jackson.module.scala.DefaultScalaModule
import edu.cdl.iot.integrations.notebook.core.repository.NotebookUploadFileRepository
import org.slf4j.LoggerFactory
import java.io.File
import java.util.UUID

class NotebookUploadService(fileRepository: NotebookUploadFileRepository) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookUploadService])

  def uploadFileObject(dataObject: Array[_] ): UUID = {
    val transactionId = UUID.randomUUID()
    logger.info("Transaction Id created")
    val file_Object = File.createTempFile(transactionId.toString,".json")
    val filePath = file_Object.toPath.toString
    logger.info(s"Temporary File is created and the path of the file is: ${filePath}")
    val mapper = JsonMapper.builder()
      .addModule(DefaultScalaModule)
      .build()

    mapper.writeValue(file_Object, dataObject)
    logger.info("Starting the File Upload on minio")
    fileRepository.uploadFile(file_Object.getName,filePath)
    logger.info("Upload Process completed")
    transactionId
  }

  def uploadFileStatus(fileName: String){
    logger.info("Checking if the file exists on Minio")
    fileRepository.uploadFileStatus(fileName)
  }

  def uploadStatus(transactionID: String): Boolean = {
    var found = false
    try {
      uploadFileStatus(transactionID)
      found = true
    } catch{
      case e:Exception => println(s"Could not find the file object on minio with transactionID: ${transactionID}")
        logger.info(s"${e.printStackTrace()}")
    }
    found
  }
}
