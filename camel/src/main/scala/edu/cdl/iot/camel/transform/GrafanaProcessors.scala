package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dao.CassandraDao
import edu.cdl.iot.camel.dto.response.{TableResponse, TagResponse, TimeSerieResponse}
import edu.cdl.iot.camel.dto.GrafanaSensorDataDto
import edu.cdl.iot.camel.dto.request.{SearchRequest, TagRequest}
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.util.TimestampHelper
import org.apache.camel.{Exchange, Processor}
import org.joda.time.DateTime

import scala.util.Sorting

object GrafanaProcessors {
  private val SCHEMA_HEADER = "REFIT_SCHEMA"


  implicit object `ByTimestamp` extends Ordering[Array[Any]] {
    def compare(a: Array[Any], b: Array[Any]): Int = {
      val a_long: Long = a(1).toString.toLong
      val b_long: Long = b(1).toString.toLong
      a_long compare b_long
    }
  }


  val getDataValue: (String, String) => Any = (target: String, data: String) => if (target.toLowerCase == "sensorid") data else data.toDouble

  val timeSeries: GrafanaSensorDataDto => TimeSerieResponse =
    record => {
      val data = record.data.map(data => {
        Array[Any](
          getDataValue(record.target, data(record.target.toLowerCase)),
          TimestampHelper.parseDate(data("timestamp")).getMillis
        )
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

  val queryProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn().getBody(classOf[List[GrafanaSensorDataDto]])
      val response = body.map(getResponse).toArray
      exchange.getIn.setBody(response)
    }
  }

  val searchProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn.getBody(classOf[SearchRequest])
      val schema = exchange.getIn.getHeader(SCHEMA_HEADER).asInstanceOf[Schema]

      exchange.getIn.setBody(
        body.target match {
          case "sensors" => CassandraDao.getSensors(schema.projectGuid.toString).toArray
          case _ => exchange.getIn.setBody(schema.fields.map(i => i.name).toArray)
        }
      )

    }
  }

  val tagProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn.getBody(classOf[TagRequest])
      val schema = exchange.getIn.getHeader(SCHEMA_HEADER).asInstanceOf[Schema]
      exchange.getIn.setBody(
        body.key match {
          case "sensor" => CassandraDao
            .getSensors(schema.projectGuid.toString)
            .map(x => new TagResponse(x))
            .toArray
          case "project" => CassandraDao.getProjects
            .map(x => new TagResponse(x))
            .toArray
          case "org" => CassandraDao.getOrgs
            .map(x => new TagResponse(x))
            .toArray
          case _ => CassandraDao.getOrgs
            .map(x => new TagResponse(x))
            .toArray
        }
      )

    }
  }
}
