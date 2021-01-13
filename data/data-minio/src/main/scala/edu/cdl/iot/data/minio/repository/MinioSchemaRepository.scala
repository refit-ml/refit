package edu.cdl.iot.data.minio.repository

import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.data.minio.MinioRepository

class MinioSchemaRepository(minioRepository: MinioRepository) {

  def findByPath(filePath: String): Schema = {
    val inputStream = minioRepository.getInputStream(
      bucketName = minioRepository.buckets.schema,
      filePath = filePath
    )
    SchemaFactory.parse(inputStream)
  }
}