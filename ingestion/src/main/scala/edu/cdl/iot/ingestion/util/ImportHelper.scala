package edu.cdl.iot.ingestion.util

import java.io.{BufferedReader, InputStreamReader}

import io.minio.{GetObjectArgs, MinioClient}

object ImportHelper {

  def getMinioLineIterator(client: MinioClient, bucket: String, path: String): Iterator[String] = {
    val getObjectRequest = GetObjectArgs.builder()
      .bucket(bucket)
      .`object`(path)
      .build()
    val stream = client.getObject(getObjectRequest)
    val reader = new BufferedReader(new InputStreamReader(stream))
    Iterator.continually(reader.readLine())
      .takeWhile(_ != null)
  }

}
