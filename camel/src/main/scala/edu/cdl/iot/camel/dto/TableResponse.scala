package edu.cdl.iot.camel.dto

import org.joda.time.Instant

class TableResponse(columns: Array[TableColumn],
                    rows: Array[Array[Any]]) {

  def getColumns: Array[TableColumn] = columns

  def getRows: Array[Array[Any]] = rows

  def getType: String = "table"

}

object TableFixtures {
  def response: TableResponse =
    new TableResponse(
      Array(
        new TableColumn("Time", "time"),
        new TableColumn("Country", "string"),
        new TableColumn("Number", "number")
      ),
      Array(
        Array(Instant.now().getMillis, "SE", 123),
        Array(Instant.now().getMillis, "DE", 123),
        Array(Instant.now().getMillis, "US", 123)
      )

  )
}
