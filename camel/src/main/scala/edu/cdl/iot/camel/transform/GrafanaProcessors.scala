package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dto.{GrafanaSensorDataDto, QueryRequest, TableResponse, TimeSerieResponse}
import org.apache.camel.{Exchange, Processor}
import org.joda.time.DateTime

import scala.util.Sorting

object GrafanaProcessors {

  implicit object `ByTimestamp` extends Ordering[Array[Any]] {
    def compare(a: Array[Any], b: Array[Any]): Int = {
      val a_long: Long = a(1).toString.toLong
      val b_long: Long = b(1).toString.toLong
      a_long compare b_long
    }
  }

  val queryProcessor: Processor = new Processor {
    val getDataValue: (String, String) => Any = (target: String, data: String) => if (target.toLowerCase == "sensorid") data else data.toDouble

    val timeSeries: GrafanaSensorDataDto => TimeSerieResponse =
      record => {
        val data = record.data.map(data => {
          Array[Any](
            getDataValue(record.target, data(record.target.toLowerCase)),
            DateTime.parse(data("timestamp")).getMillis)
        }).toArray

        Sorting.quickSort(data)(`ByTimestamp`)
        new TimeSerieResponse(
          s"${record.target} - ${record.sensorId}",
          data
        )
      }

    val table: GrafanaSensorDataDto => TableResponse = (record: GrafanaSensorDataDto) => {
      new TableResponse(Array(), Array())
    }

    val getResponse: GrafanaSensorDataDto => Object =
      record =>
        if (record.`type` == "table") table(record) else timeSeries(record)

    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn().getBody(classOf[List[GrafanaSensorDataDto]])
      val response = body.map(getResponse).toArray
      exchange.getIn.setBody(response)

    }
  }
}
