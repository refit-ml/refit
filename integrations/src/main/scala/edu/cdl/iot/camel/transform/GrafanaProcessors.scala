package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dao.{GrafanaDao, SchemaDao}
import edu.cdl.iot.camel.dto.request.{QueryFilters, QueryRequest, SearchRequest, TagRequest}
import edu.cdl.iot.camel.dto.response.{TableResponse, TagResponse, TimeSerieResponse}
import edu.cdl.iot.camel.dto.{GrafanaSensorDataDto, GrafanaSensorsDto, TableColumn}
import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.schema.enums.FieldClassification
import edu.cdl.iot.common.schema.{Field, Schema}
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.TimestampHelper
import javax.crypto.Cipher
import org.apache.camel.{Exchange, Processor}

import scala.Array.ofDim
import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import scala.util.Sorting

class GrafanaProcessors(private val config: RefitConfig,
                        private val schemaDao: SchemaDao,
                        private val grafanaDao: GrafanaDao) {

  val ENCRYPTION_KEY: String = config.getEncryptionKey()
  val SCHEMA_HEADER = "REFIT_SCHEMA"
  val ORG_HEADER = "REFIT_ORG"
  val QUERY_PARTITIONS_HEADER = "REFIT_QUERY_PARTITIONS"
  val decryptionHelpers: mutable.HashMap[String, EncryptionHelper] = new mutable.HashMap[String, EncryptionHelper]()


  private val getEncryptionHelper: String => EncryptionHelper = projectGuid =>
    decryptionHelpers.getOrElseUpdate(projectGuid, {
      new EncryptionHelper(ENCRYPTION_KEY, projectGuid, Cipher.DECRYPT_MODE)
    })

  implicit object `ByTimestamp` extends Ordering[Array[Any]] {
    def compare(a: Array[Any], b: Array[Any]): Int = {
      val a_long: Long = a(1).toString.toLong
      val b_long: Long = b(1).toString.toLong
      a_long compare b_long
    }
  }


  val getDataValue: (String, String) => Any = (target: String, data: String) => if (target.toLowerCase == "sensorid") data else data.toDouble

  val toTimeSeriesFormat: (String, GrafanaSensorDataDto) => TimeSerieResponse =
    (target: String, record: GrafanaSensorDataDto) =>
      new TimeSerieResponse(s"${target} - ${record.sensorId}",
        record.data.map(data => {
          Array[Any](
            getDataValue(target, data(target.toLowerCase)),
            TimestampHelper.parseDate(data("timestamp")).getMillis
          )
        }).toArray)


  // need to return list of time series responses (same for table)
  val timeSeries: GrafanaSensorDataDto => List[TimeSerieResponse] =
    record => record.targets.map(target => toTimeSeriesFormat(target, record))


  val table: GrafanaSensorDataDto => TableResponse =
    (record: GrafanaSensorDataDto) => {
      // Be from our targets create this list
      val columns: Array[TableColumn] = record.targets.map(target => new TableColumn(target, record.`type`)).toArray
      // loop on data, then for each target extract that column into the row
      val rows = record.data.map(row =>
        record.targets.map( colName => row(colName.toLowerCase).asInstanceOf[Any]).toArray ).toArray
      new TableResponse(columns, rows)
    }

  val getResponse: GrafanaSensorDataDto => List[Object] =
    record =>
      if (record.`type` == "table") List(table(record)) else timeSeries(record)


  private val sensorFilterPredicate: QueryFilters => Boolean =
    (x: QueryFilters) => x.key == "sensor" && (x.operator == "=" || x.operator == ">" || x.operator == "<")

  private val getAllSensors: String => List[String] =
    (projectGuid: String) =>
      grafanaDao.getSensors(projectGuid)

  def sortQueryFilters (filters : Array[QueryFilters]) : Array[Array[String]] = {
    val returnedFilters = ofDim[String](filters.length,2)
    var iter = 0
    for(filter <- filters){
      returnedFilters(iter)(0)  = filter.value
      returnedFilters(iter)(1) = filter.operator
    }
    iter += 1
    Sorting.quickSort(returnedFilters)(new Ordering[Array[String]] {
      def compare (x: Array[String], y: Array[String]): Int = {
        x(0).toInt compare y(0).toInt
      }
    })
    returnedFilters
  }

  def filterSensorIdsFunc (filters: Array[Array[String]], allSensors : List[String]) : List[String] = {
    allSensors.map(_.toInt)
    var returnedSensors = new ListBuffer[String]()
    var iter = 1
    for (sensorFilter <- filters.sliding(2)){
      if(sensorFilter(0)(1) == "="){
        returnedSensors += sensorFilter(0)(0)
      }
      if (sensorFilter(0)(1) == ">"){
        var i = 1
        while (sensorFilter(0)(0).toInt + i < sensorFilter(1)(0).toInt){
          returnedSensors += (sensorFilter(0)(0).toInt + i).toString
          i = i + 1
        }
      }
      if ((sensorFilter(0)(1) == "<") && (iter == 1) ){
        var i = 1
        while ( i < sensorFilter(0)(0).toInt ){
          returnedSensors += i.toString
          i = i+1
        }
      }
      iter = iter + 1
      if (iter == filters.length){
        if (sensorFilter(1)(1) == "=")
          returnedSensors += sensorFilter(1)(0)
        if (sensorFilter(1)(1) == ">") {
          var i = 1
          while(sensorFilter(1)(0).toInt + i <= allSensors.last.toInt) {
            returnedSensors += (sensorFilter(1)(0).toInt + i).toString
            i = i + 1
          }

        }
      }
    }
    returnedSensors.toList
  }

  private val getSensorIds: (String, Array[QueryFilters]) => List[String] =
    (projectGuid: String, filters: Array[QueryFilters]) =>
      if (filters.exists(sensorFilterPredicate))
        filterSensorIdsFunc(sortQueryFilters(filters), getAllSensors(projectGuid))
      else
        getAllSensors(projectGuid)

  private val mapToSensorIds: (Schema, QueryRequest) => GrafanaSensorsDto =
    (schema: Schema, request: QueryRequest) =>
      GrafanaSensorsDto(
        schema.projectGuid.toString,
        request.targets.head.`type`,
        request.targets.map(x => x.target).toList,
        getSensorIds(schema.projectGuid.toString, request.adhocFilters))

  private val getSensorReadings: (GrafanaSensorsDto, String, List[String]) => GrafanaSensorDataDto =
    (sensors: GrafanaSensorsDto, sensorId: String, partitions: List[String]) => {
      val result = grafanaDao.getSensorData(getEncryptionHelper,
        sensors.projectGuid,
        sensorId,
        partitions)

      val data = result.filter(x => sensors.targets.exists(y => x.contains(y.toLowerCase)))

      GrafanaSensorDataDto(
        sensors.projectGuid,
        sensors.`type`,
        sensors.targets,
        sensorId,
        data
      )
    }

  val queryProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn().getBody(classOf[List[GrafanaSensorDataDto]])
      val response = body.flatMap(getResponse).toArray
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
      val schemas = schemaDao.getProjectSchemas
      exchange.getIn.setBody(
        body.target match {
          case "sensors" => grafanaDao.getAllSensors.toArray
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
          case "sensor" => grafanaDao
            .getAllSensors
            .map(x => new TagResponse(x))
            .toArray
          case "project" => grafanaDao.getProjects
            .map(x => new TagResponse(x))
            .toArray
          case "org" => grafanaDao.getOrgs
            .map(x => new TagResponse(x))
            .toArray
          case _ => grafanaDao.getOrgs
            .map(x => new TagResponse(x))
            .toArray
        }
      )
    }
  }


  val grafanaQuery: Processor = new Processor {

    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn.getBody(classOf[QueryRequest])
      val schema = exchange.getIn.getHeader(SCHEMA_HEADER, classOf[Schema])
      val partitions = exchange.getIn.getHeader(QUERY_PARTITIONS_HEADER, classOf[List[String]])

      val sensors = mapToSensorIds(schema, record)

      val data = sensors.sensors.map(x => getSensorReadings(sensors, x, partitions))

      exchange.getIn.setBody(data)
    }
  }
}
