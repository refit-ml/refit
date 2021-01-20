package edu.cdl.iot.data.minio.repository

import edu.cdl.iot.data.minio.MinioRepository

class MinioModelRepository(minioRepository: MinioRepository) extends Serializable {

  def getModel(filePath: String): Array[Byte] =
    minioRepository.getBytes(
      bucketName = minioRepository.buckets.models,
      filePath = filePath
    )
}