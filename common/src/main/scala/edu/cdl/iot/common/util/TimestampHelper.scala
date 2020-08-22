package edu.cdl.iot.common.util

import java.sql.Timestamp
import java.time.Instant

import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat

object TimestampHelper {
  val parseDate: String => DateTime = (timestamp: String) =>
    DateTime.parse(timestamp, DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss"))

  val parse: String => Timestamp =
    (timestamp: String) =>
      Timestamp.from(Instant.ofEpochMilli(parseDate(timestamp).getMillis))
}
