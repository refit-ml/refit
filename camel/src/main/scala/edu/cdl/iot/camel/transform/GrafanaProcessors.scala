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


  implicit object `ByTimestamp` extends Ordering[Array[Any]] {
    def compare(a: Array[Any], b: Array[Any]): Int = {
      val a_long: Long = a(1).toString.toLong
      val b_long: Long = b(1).toString.toLong
      a_long compare b_long
    }
  }


  val getDataValue: (String, String) => Any = (target: String, data: String) => if (target.toLowerCase == "sensorid") data else data.toDouble

  // need to return list of time series responses (same for table)
  val timeSeries: GrafanaSensorDataDto => List[TimeSerieResponse] =
    record => {
      val data = record.data.map(data => {
        Array[Any](
          getDataValue(record.targets, data(record.targets),
          TimestampHelper.parseDate(data("timestamp")).getMillis
        )
      }).toArray

      Sorting.quickSort(data)(`ByTimestamp`)


      new List[TimeSerieResponse(
        s"${record.targets} - ${record.sensorId}",
        data
      )]
    }

  val table: GrafanaSensorDataDto => List[TableResponse] =
    (record: GrafanaSensorDataDto) => {
      val data = record.data.map(data => {
        Array[Any](
          // list of strings -> target
          getDataValue(record.targets, data(record.targets.toLowerCase))
        )
      }).toArray

      new TableResponse(Array(new TableColumn(record.targets, "String")), data)
  }

  // return list of objects
  val getResponse: GrafanaSensorDataDto => List[Object] =
    record =>
      if (record.`type` == "table") table(record) else timeSeries(record)

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
