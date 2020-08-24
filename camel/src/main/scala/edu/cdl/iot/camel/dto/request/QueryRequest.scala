package edu.cdl.iot.camel.dto.request

import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@JsonIgnoreProperties(ignoreUnknown = true)
class QueryTarget(var target: String,
                  var refId: String,
                  var `type`: String) {
  def this() = this("", "", "")

  def getTarget: String = target

  def getRefId: String = refId

  def getType: String = `type`
}

@JsonIgnoreProperties(ignoreUnknown = true)
class QueryRangeRaw(var from: String,
                    var to: String) {
  def this() = this("", "")

  def getFrom: String = from

  def getTo: String = to
}

@JsonIgnoreProperties(ignoreUnknown = true)
class QueryRange(var from: String,
                 var to: String,
                 var raw: QueryRangeRaw) {
  def this() = this("", "", null)

  def getFrom: String = from

  def getTo: String = to

  def getRaw: QueryRangeRaw = raw
}

@JsonIgnoreProperties(ignoreUnknown = true)
class QueryFilters(var key: String,
                   var operator: String,
                   var value: String) {
  def this() = this(null, null, null)

  def getKey: String = key

  def getOperator: String = operator

  def getValue: String = value

}

@JsonIgnoreProperties(ignoreUnknown = true)
class QueryRequest(var panelId: String,
                   var targets: Array[QueryTarget],
                   var range: QueryRange,
                   var rangeRaw: QueryRangeRaw,
                   var interval: String,
                   var intervalMs: Long,
                   var adhocFilters: Array[QueryFilters],
                   var format: String,
                   var maxDataPoints: Long) {
  def this() = this(null, null, null, null, null, 0, null, null, 0)

  def getPanelId: String = panelId

  def getTargets: Array[QueryTarget] = targets

  def getRange: QueryRange = range

  def getRangeRaw: QueryRangeRaw = rangeRaw

  def getInterval: String = interval

  def getIntervalMs: Long = intervalMs

  def getAdhocFilters: Array[QueryFilters] = adhocFilters

  def getFormat: String = format

  def getMaxDataPoints: Long = maxDataPoints


}
