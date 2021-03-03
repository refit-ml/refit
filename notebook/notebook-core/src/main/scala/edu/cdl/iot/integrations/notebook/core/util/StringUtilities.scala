package edu.cdl.iot.integrations.notebook.core.util

import java.time.Instant

import com.google.protobuf.timestamp.Timestamp
import edu.cdl.iot.common.util.TimestampHelper

object StringUtilities {
  def toDouble(x: String): Double = {
    try {
      x.toDouble
    }
    catch {
      case ex: NumberFormatException => 0.0
    }
  }

  def toInt(x: String): Int = {
    try {
      x.toInt
    }
    catch {
      case ex: NumberFormatException => 0
    }
  }

  def toInstant(x: String): Instant = TimestampHelper.parse(x).toInstant

  def toProtoTimestamp(x: String): Timestamp = {
    val instant = toInstant(x)
    new Timestamp(instant.getEpochSecond, instant.getNano)
  }
}
