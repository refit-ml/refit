package edu.cdl.iot.db.fixtures.`import`

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.db.fixtures.dto.TrainingWindow

import scala.io.Source

object TrainingWindowImport {
  def load(schema: Schema): List[TrainingWindow] = {
    val bufferedSource = Source.fromFile(s"${System.getProperty("user.dir")}/db/data/import/${schema.getFileName}-training-window.csv")
    val lines = bufferedSource.getLines()
    if (schema.importOptions.includesHeader) lines.drop(1)
    val result = lines.map(line => {
      val row = line.split(",").map(_.trim)
      TrainingWindow(
        schema.projectGuid.toString,
        row(0),
        row(1),
        TimestampHelper.parse(row(2)),
        TimestampHelper.parse(row(3))
      )
    }).toList

    bufferedSource.close
    result
  }

}
