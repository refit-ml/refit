package edu.cdl.iot.integrations.dto.response

import edu.cdl.iot.integrations.dto.TableColumn
import org.joda.time.{Duration, Instant}

class TableResponse(columns: Array[TableColumn],
                    rows: Array[Array[Any]]) {

  def getColumns: Array[TableColumn] = columns

  def getRows: Array[Array[Any]] = rows

  def getType: String = "table"

}

object TableFixtures {

  val random = new scala.util.Random

  def random(start: Int, end: Int): Int = start + random.nextInt((end - start) + 1)

  def response: TableResponse = {
    val lst = Array.ofDim[Any](100, 2)

    for (x <- 0 to 99) {
      lst(x) = Array(Instant.now().minus(Duration.standardMinutes(10)).getMillis, random(1110, 1115).toString, random(1, 1000))
    }
    new TableResponse(
      Array(
        new TableColumn("Time", "time"),
        new TableColumn("SensorID", "string"),
        new TableColumn("Number", "number")
      ),
      lst

    )
  }
}
