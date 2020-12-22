package edu.cdl.iot.common.util

import java.sql.Timestamp
import java.time.Instant

import org.joda.time.DateTime
import org.joda.time.format.{DateTimeFormat, DateTimeFormatterBuilder}

object TimestampHelper {
  val parseDate: String => DateTime = (timestamp: String) => {
    val builder = new DateTimeFormatterBuilder()
    builder.append(DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss").getParser)
    builder.appendOptional(DateTimeFormat.forPattern(".S").getParser)
    builder.appendOptional(DateTimeFormat.forPattern("S").getParser)
    builder.appendOptional(DateTimeFormat.forPattern("S").getParser)
    builder.appendOptional(DateTimeFormat.forPattern("S").getParser)
    builder.appendOptional(DateTimeFormat.forPattern("S").getParser)
    builder.appendOptional(DateTimeFormat.forPattern("S").getParser)
    builder.appendOptional(DateTimeFormat.forPattern("S").getParser)
    builder.appendOptional(DateTimeFormat.forPattern("S").getParser)
    builder.appendOptional(DateTimeFormat.forPattern("S").getParser)

    DateTime.parse(timestamp, builder.toFormatter)
  }


  val parse: String => Timestamp =
    (timestamp: String) =>
      Timestamp.from(Instant.ofEpochMilli(parseDate(timestamp).getMillis))

  val toTimestamp: DateTime => Timestamp =
    (timestamp: DateTime) =>
      Timestamp.from(Instant.ofEpochMilli(timestamp.getMillis))
}
