package edu.cdl.iot.ingestion.factories

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.ingestion.dto.TrainingWindow

class TrainingWindowFactory(val schema: Schema) {

  def fromDelimited(row: Array[String]): TrainingWindow = {
    TrainingWindow(
      schema.projectGuid.toString,
      row(1),
      schema.getPartitionString(TimestampHelper.parseDate(row(2))),
      TimestampHelper.parse(row(2)),
      TimestampHelper.parse(row(3))
    )
  }

  def fromCsv(line: String): TrainingWindow = fromDelimited(line.split(",").map(_.trim))


  def fromTsv(line: String): TrainingWindow = fromDelimited(line.split("\t").map(_.trim))
}
