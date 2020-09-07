package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dao.CassandraDao
import edu.cdl.iot.camel.dto.response.{TableResponse, TagResponse, TimeSerieResponse}
import edu.cdl.iot.camel.dto.{GrafanaSensorDataDto, TableColumn}
import edu.cdl.iot.camel.dto.request.{SearchRequest, TagRequest}
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.util.TimestampHelper
import org.apache.camel.{Exchange, Processor}

import scala.util.Sorting

object GrafanaProcessors {
  private val SCHEMA_HEADER = "REFIT_SCHEMA"


  val getDataValue: (String, String) => Any = (target: String, data: String) => if (target.toLowerCase == "sensorid") data else data.toDouble

  val toTimeSeriesFormat: (String, GrafanaSensorDataDto) => TimeSerieResponse =
    (target: String, record: GrafanaSensorDataDto) =>
      new TimeSerieResponse(s"${target} - ${record.sensorId}",
        record.data.map(data => {
          Array[Any](
            getDataValue(target, data(target)),
            TimestampHelper.parseDate(data("timestamp")).getMillis
          )
        }).toArray)


  // need to return list of time series responses (same for table)
  val timeSeries: GrafanaSensorDataDto => List[TimeSerieResponse] =
    record => record.targets.map(target => toTimeSeriesFormat(target, record))


  val table: GrafanaSensorDataDto => TableResponse =
    (record: GrafanaSensorDataDto) => {
      val columns: Array[TableColumn] = _ // Be from our targets create this list
      val rows: Array[Array[Any]] = _ // loop on data, then for each target extract that column into the row
      val data = record.data.map(row => {
        val value = row("my_target")
      }).toArray

      new TableResponse(columns, rows)
    }

  // return list of objects
  val getResponse: GrafanaSensorDataDto => List[Object] =
    record =>
      if (record.`type` == "table") List(table(record)) else timeSeries(record)

  val queryProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn().getBody(classOf[List[GrafanaSensorDataDto]])
      // change to flatmap
      val response = body.flatMap(getResponse).toArray
      exchange.getIn.setBody(response)
    }
  }

  val searchProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn.getBody(classOf[SearchRequest])
      val schemas = CassandraDao.getProjectSchemas
      exchange.getIn.setBody(
        body.target match {
          case "sensors" => CassandraDao.getAllSensors.toArray
          case _ => schemas.flatMap(schema => schema.fields.map(i => i.name)).toArray
        }
      )

    }
  }

  val tagProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn.getBody(classOf[TagRequest])
      exchange.getIn.setBody(
        body.key match {
          case "sensor" => CassandraDao
            .getAllSensors
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
