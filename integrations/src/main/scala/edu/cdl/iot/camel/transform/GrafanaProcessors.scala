package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dao.CassandraDao
import edu.cdl.iot.camel.dto.response.{TableResponse, TagResponse, TimeSerieResponse}
import edu.cdl.iot.camel.dto.GrafanaSensorDataDto
import edu.cdl.iot.camel.dto.request.{SearchRequest, TagRequest}
import edu.cdl.iot.common.schema.enums.FieldClassification
import edu.cdl.iot.common.schema.{Field, Schema}
import edu.cdl.iot.common.util.TimestampHelper
import org.apache.camel.{Exchange, Processor}

import scala.util.Sorting

class GrafanaProcessors(private val dao: CassandraDao) {


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

    val fieldMapper: Field => List[String] =
      field =>
        if (field.classification == FieldClassification.Label)
          List(s"Actual - ${field.name}", s"Prediction - ${field.name}")
        else
          List(field.name)

    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn.getBody(classOf[SearchRequest])
      val schemas = dao.getProjectSchemas
      exchange.getIn.setBody(
        body.target match {
          case "sensors" => dao.getAllSensors.toArray
          case _ => schemas.flatMap(schema => schema.fields.flatMap(fieldMapper)).toArray
        }
      )

    }
  }

  val tagProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn.getBody(classOf[TagRequest])
      exchange.getIn.setBody(
        body.key match {
          case "sensor" => dao
            .getAllSensors
            .map(x => new TagResponse(x))
            .toArray
          case "project" => dao.getProjects
            .map(x => new TagResponse(x))
            .toArray
          case "org" => dao.getOrgs
            .map(x => new TagResponse(x))
            .toArray
          case _ => dao.getOrgs
            .map(x => new TagResponse(x))
            .toArray
        }
      )

    }
  }
}
