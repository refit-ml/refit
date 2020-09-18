package edu.cdl.iot.db.fixtures.`import`

import java.io.FileNotFoundException

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.db.fixtures.dto.SensorData

import scala.io.Source

object SensorDataImport {
  // This is bad and "leaky" since we leave the stream open
  // TODO, make this a class and add open, fetch, and close methods
  def load(schema: Schema, encryptionHelper: EncryptionHelper): Iterator[SensorData] = {
    try {
      val bufferedSource = Source.fromFile(s"${System.getProperty("user.dir")}/db/data/import/${schema.getFileName}.csv")
      val lines = bufferedSource.getLines()
      if (schema.importOptions.includesHeader) lines.drop(1)
      val result = lines.map(line => {
        val row = line.split(",").map(_.trim)
        val key = schema.getKey(row)
        val timestampParts = schema.getTimestamp(row).split("\t")
        val timestamp = timestampParts(0).replace(".0", "")
        val features = schema.getFeatures(row)
        val labels = schema.getLabels(row)

        SensorData(
          schema.projectGuid.toString,
          key,
          schema.getPartitionString(TimestampHelper.parseDate(timestamp)),
          TimestampHelper.parse(timestamp),
          encryptionHelper.transform(features),
          encryptionHelper.transform(labels)
        )
      })
      result
    }
    catch {
      case e: FileNotFoundException =>
        println(s"Sensor Data not found for ${schema.name} - ${schema.projectGuid}. Skipping")
        Iterator()
    }

  }
}
