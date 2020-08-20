package edu.cdl.iot.camel.dto

import org.joda.time.Instant

class TimeSerieResponse(target: String,
                        datapoints: Array[Array[Any]]) {

  def this() = this(null, null)

  def getTarget: String = target

  def getDatapoints: Array[Array[Any]] = datapoints

}


object TimeSerieFixtures {
  def response(target: String): TimeSerieResponse =
    new TimeSerieResponse(target, Array(
      Array(1234, Instant.now().getMillis),
      Array(1235, Instant.now().getMillis)
    )
    )
}