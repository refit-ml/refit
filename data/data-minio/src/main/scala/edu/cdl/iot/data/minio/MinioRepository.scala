package edu.cdl.iot.data.minio

import edu.cdl.iot.common.yaml.{MinioBucket, MinioConfig}
import io.minio._

import java.io.InputStream

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

  def uploadFileObject(bucketName: String, fileName: String, filePath: String) {
    minioClient
      .uploadObject(UploadObjectArgs.builder()
        .bucket(bucketName)
        .`object`(fileName)
        .filename(filePath)
        .build())
  }

  def uploadFileStatus(bucketName: String, fileName: String){
    minioClient
      .statObject(StatObjectArgs.builder.bucket(bucketName)
        .`object`(fileName)
        .build())
  }

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
