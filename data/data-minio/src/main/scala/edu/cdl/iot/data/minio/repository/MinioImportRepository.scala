package edu.cdl.iot.data.minio.repository

import java.io.{BufferedReader, InputStreamReader}

import edu.cdl.iot.data.minio.MinioRepository

class MinioImportRepository(minioRepository: MinioRepository) {
  def lineIterator(bucketName: String, key: String): Iterator[String] = {
    val stream = minioRepository.getInputStream(bucketName, key)
    val reader = new BufferedReader(new InputStreamReader(stream))
    Iterator.continually(reader.readLine())
      .takeWhile(_ != null)
  }

  def fileBytes(bucketName: String, key: String): Unit = minioRepository.getBytes(bucketName, key)

  def deleteFile(bucketName: String, key: String) = minioRepository.deleteFile(bucketName, key)
}
