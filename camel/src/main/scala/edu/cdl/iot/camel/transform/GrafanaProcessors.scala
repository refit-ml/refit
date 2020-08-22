package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dto.{QueryRequest, TableResponse, TimeSerieResponse}
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
    val getDataValue = (target: String, data: String) => if (target.toLowerCase == "sensorid") data else data.toDouble

    val timeSeries: ((String, String, List[Map[String, String]])) => TimeSerieResponse = (target: (String, String, List[Map[String, String]])) => {
      val data = target._3.map(data => {
        Array[Any](
          getDataValue(target._2, data(target._2.toLowerCase)),
          DateTime.parse(data("timestamp")).getMillis)
      }).toArray
      Sorting.quickSort(data)(`ByTimestamp`)
      new TimeSerieResponse(
        target._2,
        data
      )
    }

    val table: ((String, String, List[Map[String, String]])) => TableResponse = (target: (String, String, List[Map[String, String]])) => {
      new TableResponse(Array(), Array())
    }

    val getResponse: ((String, String, List[Map[String, String]])) => Object =
      (target: (String, String, List[Map[String, String]])) =>
        if (target._1 == "table") table(target) else timeSeries(target)

    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn().getBody(classOf[Array[(String, String, List[Map[String, String]])]])
      val response = body.map(getResponse)
      exchange.getIn.setBody(response)

    }
  }
}
