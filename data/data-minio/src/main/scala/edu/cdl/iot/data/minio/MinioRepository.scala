package edu.cdl.iot.data.minio

import java.io.InputStream

import edu.cdl.iot.common.yaml.{MinioBucket, MinioConfig}
import io.minio.{GetObjectArgs, MinioClient, RemoveObjectArgs}

class MinioRepository(config: MinioConfig) extends Serializable {

  val buckets: MinioBucket = config.buckets

  private val minioClient = MinioClient.builder
    .endpoint(config.host)
    .credentials(config.accessKey, config.secretKey)
    .build


  def getInputStream(bucketName: String, filePath: String): InputStream =
    minioClient
      .getObject(GetObjectArgs.builder()
        .bucket(bucketName)
        .`object`(filePath)
        .build())

  def getBytes(bucketName: String, filePath: String): Array[Byte] = {
    val inputStream = getInputStream(bucketName, filePath)
    val bytes = Stream.continually(inputStream.read())
      .takeWhile(_ != -1)
      .map(_.toByte)
      .toArray
    inputStream.close()
    bytes
  }


  def deleteFile(bucketName: String, filePath: String): Unit =
    minioClient.removeObject(RemoveObjectArgs.builder().bucket(bucketName).`object`(filePath).build)

}
