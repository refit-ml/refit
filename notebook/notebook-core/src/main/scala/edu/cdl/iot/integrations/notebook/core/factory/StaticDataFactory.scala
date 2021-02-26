package edu.cdl.iot.integrations.notebook.core.factory

import edu.cdl.iot.common.schema.{DataSource, Schema}
import edu.cdl.iot.common.schema.enums.FieldType
import edu.cdl.iot.integrations.notebook.core.util.StringUtilities
import edu.cdl.iot.protocol.StaticData.StaticData

class StaticDataFactory(val schema: Schema,
                        val dataSource: DataSource) {


  def fromDelimited(row: Array[String]): StaticData = StaticData(
    projectGuid = schema.projectGuid.toString,
    key = dataSource.getKey(row),
    timestamp = Option.apply(StringUtilities
      .toProtoTimestamp(dataSource.getTimestamp(row))),
    doubles = dataSource
      .getFeaturesWithType(row, FieldType.Double)
      .map(x => x._1 -> StringUtilities.toDouble(x._2)),
    strings = dataSource
      .getFeaturesWithType(row, FieldType.String),
    integers = dataSource
      .getFeaturesWithType(row, FieldType.Integer)
      .map(x => x._1 -> StringUtilities.toInt(x._2)),
    timestamps = dataSource
      .getFeaturesWithType(row, FieldType.DateTime)
      .map(x => x._1 -> StringUtilities.toProtoTimestamp(x._2))
  )


  def fromCsv(line: String): StaticData = fromDelimited(line.split(",").map(_.trim))


}

