package edu.cdl.iot.db.fixtures.`import`

import java.io.FileNotFoundException

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.db.fixtures.dto.TrainingWindow

import scala.io.Source

// This is inefficent
// TODO, make this a class, open a stream then import and close the stream when its done
object TrainingWindowImport {
  def load(schema: Schema): List[TrainingWindow] = {
    try {
      val bufferedSource = Source.fromFile(s"${System.getProperty("user.dir")}/db/data/import/${schema.getFileName}-training-window.csv")
      val lines = bufferedSource.getLines()
      if (schema.importOptions.includesHeader) lines.drop(1)
      val result = lines.map(line => {
        val row = line.split(",").map(_.trim)
        TrainingWindow(
          schema.projectGuid.toString,
          row(1),
          schema.getPartitionString(TimestampHelper.parseDate(row(2))),
          TimestampHelper.parse(row(2)),
          TimestampHelper.parse(row(3))
        )
      }).toList

      bufferedSource.close
      result
    }
    catch {
      case e: FileNotFoundException =>
        println(s"Training window not found for ${schema.name} - ${schema.projectGuid}. Skipping")
        List()
    }
  }

}
