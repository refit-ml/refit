package edu.cdl.iot.db.fixtures.`import`

import java.sql.Timestamp
import java.time.Instant

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.db.fixtures.dto.SensorData

import scala.io.Source

object SensorDataImport {
  def load(schema: Schema, encryptionHelper: EncryptionHelper): List[SensorData] = {
    val bufferedSource = Source.fromFile(s"${System.getProperty("user.dir")}/db/data/import/${schema.getFileName}.csv")
    val lines = bufferedSource.getLines()
    if (schema.importOptions.includesHeader) lines.drop(1)
    val result = lines.map(line => {
      val row = line.split(",").map(_.trim)
      val key = schema.getKey(row)
      val timestampParts = schema.getTimestamp(row).split("\t")
      val timestamp = timestampParts(0)
      val features = schema.getFeatures(row)
      val labels = schema.getLabels(row)

      SensorData(
        schema.projectGuid.toString,
        key,
        key,
        TimestampHelper.parse(timestamp),
        encryptionHelper.transform(features),
        encryptionHelper.transform(labels)
      )
    }).toList

    bufferedSource.close
    result
  }
}
