package edu.cdl.iot.ingestion.util

import java.io.InputStream


object MinioHelper {
  def inputStreamToBytes(stream: InputStream): Array[Byte] = Stream.continually(stream.read).takeWhile(_ != -1).map(_.toByte).toArray
}
