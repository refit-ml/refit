package edu.cdl.iot.integrations.notebook.core.service

import edu.cdl.iot.integrations.notebook.core.repository.NotebookUploadFileRepository
import org.slf4j.LoggerFactory

class NotebookUploadService(fileRepository: NotebookUploadFileRepository) {
  private val logger = LoggerFactory.getLogger(classOf[NotebookUploadService])

  def uploadFileObject(fileName: String, filePath: String){
    logger.info("Starting the File Upload on minio")
    fileRepository.uploadFile(fileName,filePath)
  }

  def uploadFileStatus(fileName: String){
    logger.info("Checking if the file exists on Minio")
    val isAvailable = fileRepository.uploadFileStatus(fileName)
    isAvailable
  }
}
