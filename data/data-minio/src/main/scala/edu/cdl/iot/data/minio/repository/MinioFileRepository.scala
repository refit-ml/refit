package edu.cdl.iot.data.minio.repository

import edu.cdl.iot.data.minio.MinioRepository

class MinioFileRepository(minioRepository: MinioRepository){

  def uploadFile(fileName: String, filePath: String){
    minioRepository.uploadFileObject(
      bucketName = minioRepository.buckets.models,
      fileName, filePath)
  }

  def uploadFileStatus(fileName: String){
    minioRepository.uploadFileStatus(
      bucketName = minioRepository.buckets.models,
      fileName)
  }
}
