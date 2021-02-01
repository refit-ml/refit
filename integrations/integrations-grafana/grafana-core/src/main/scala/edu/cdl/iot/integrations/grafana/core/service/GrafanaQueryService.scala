package edu.cdl.iot.integrations.grafana.core.service

import java.util.UUID

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.integrations.grafana.core.dto.{GrafanaSensorDataDto, GrafanaSensorsDto, TableColumn}
import edu.cdl.iot.integrations.grafana.core.repository.{GrafanaProjectRepository, GrafanaSensorDataRepository, GrafanaSensorRepository}
import edu.cdl.iot.integrations.grafana.core.request.{QueryFilters, QueryRequest}
import edu.cdl.iot.integrations.grafana.core.response.{TableResponse, TimeSerieResponse}
import org.joda.time.DateTime

class GrafanaQueryService(projectRepository: GrafanaProjectRepository,
                          sensorRepository: GrafanaSensorRepository,
                          sensorDataRepository: GrafanaSensorDataRepository) {

  private def getDataValue(target: String, data: String): Any =
    if (target.toLowerCase == "sensorid") data else data.toDouble

  private def toTimeSeriesFormat(target: String, record: GrafanaSensorDataDto): TimeSerieResponse =
    new TimeSerieResponse(s"${target} - ${record.sensorId}",
      record.data.map(data => {
        Array[Any](
          getDataValue(target, data(target.toLowerCase)),
          TimestampHelper.parseDate(data("timestamp")).getMillis
        )
      }).toArray)


  // need to return list of time series responses (same for table)
  private def timeSeries(record: GrafanaSensorDataDto): List[TimeSerieResponse] =
    record.targets.map(target => toTimeSeriesFormat(target, record))


  private def table(record: GrafanaSensorDataDto) = {
    // Be from our targets create this list
    val columns: Array[TableColumn] = record.targets.map(target => new TableColumn(target, record.`type`)).toArray
    // loop on data, then for each target extract that column into the row
    val rows = record.data.map(row =>
      record.targets.map(colName => row(colName.toLowerCase).asInstanceOf[Any]).toArray).toArray
    new TableResponse(columns, rows)
  }

  private def getResponse(record: GrafanaSensorDataDto): List[Object] =
    if (record.`type` == "table") List(table(record)) else timeSeries(record)


  private val sensorFilterPredicate: QueryFilters => Boolean =
    (x: QueryFilters) => x.key == "sensor" && (x.operator == "=" || x.operator == ">" || x.operator == "<")

  private val isEqualToType: (QueryFilters, String) => Boolean =
    (filter: QueryFilters, key: String) =>
      filter.operator == "=" && filter.key == key

  def query(request: GrafanaSensorDataDto): List[Object] = getResponse(request)

  val sensorFilterEquals: QueryFilters => Boolean =
    (x: QueryFilters) => x.operator == "="

  val sensorFilterLesser: QueryFilters => Boolean =
    (x: QueryFilters) => x.operator == "<"

  val sensorFilterGreater: QueryFilters => Boolean =
    (x: QueryFilters) => x.operator == ">"

  def Greater(filter: Int, all: List[String]): Array[String] =
    all.filter( _.toInt > filter ).toArray

  def Lesser(filter: Int, all: List[String]): Array[String] =
    all.filter( _.toInt < filter ).toArray

  val allSensors : String => List[String] =
    (x : String) => sensorRepository.findAll(x)


  def getSensorIds(projectGuid: String, filters: Array[QueryFilters]): List[String] =
    if (filters.exists(sensorFilterPredicate)) {

      if (filters.exists(sensorFilterGreater)) {
        val G = Greater(filters.filter(sensorFilterGreater).map(filter => filter.value.toInt).max, allSensors(projectGuid) )
        G.toList
      }
      else if (filters.exists(sensorFilterLesser)) {
        val L = Lesser(filters.filter(sensorFilterLesser).map(filter => filter.value.toInt).min, allSensors(projectGuid) )
        L.toList
      }
      else  {
        filters.filter(sensorFilterEquals).map(filter => filter.value).toList
      }
    }
    else
      allSensors(projectGuid)


  def getOrganization(request: QueryRequest): String =
    request.adhocFilters
      .filter(x => isEqualToType(x, "org"))
      .head.value
      .split(" - ")
      .last
      .trim

  def getSchema(request: QueryRequest): Schema = {
    val projectGuid = UUID.fromString(request.adhocFilters
      .filter(x => isEqualToType(x, "project"))
      .head.value
      .split(" - ")
      .last
      .trim)
    projectRepository.find(projectGuid).schema
  }

  def getQueryPartitions(request: QueryRequest, schema: Schema): List[String] = {
    val from = DateTime.parse(request.range.from)
    val to = DateTime.parse(request.range.to)
    schema.getPartitionsInRange(from, to)
  }

  private val mapToSensorIds: (Schema, QueryRequest) => GrafanaSensorsDto =
    (schema: Schema, request: QueryRequest) =>
      GrafanaSensorsDto(
        schema.projectGuid.toString,
        request.targets.head.`type`,
        request.targets.map(x => x.target).toList,
        getSensorIds(schema.projectGuid.toString, request.adhocFilters))

  private val getSensorReadings: (GrafanaSensorsDto, String, List[String]) => GrafanaSensorDataDto =
    (sensors: GrafanaSensorsDto, sensorId: String, partitions: List[String]) => {
      val result = sensorDataRepository.find(
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

  def getQueryData(request: QueryRequest, schema: Schema, partitions: List[String]): List[GrafanaSensorDataDto] = {
    val sensors = mapToSensorIds(schema, request)
    sensors.sensors.map(x => getSensorReadings(sensors, x, partitions))
  }

}
