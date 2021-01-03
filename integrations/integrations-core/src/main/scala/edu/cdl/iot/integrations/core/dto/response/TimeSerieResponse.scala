package edu.cdl.iot.integrations.core.dto.response

import org.joda.time.{Duration, Instant}

import scala.util.Sorting


object `ByTimestamp` extends Ordering[Array[Any]] {
  def compare(a: Array[Any], b: Array[Any]): Int = {
    val a_long: Long = a(1).toString.toLong
    val b_long: Long = b(1).toString.toLong
    a_long compare b_long
  }
}

class TimeSerieResponse(target: String,
                        datapoints: Array[Array[Any]]) {

  Sorting.quickSort(datapoints)(`ByTimestamp`)

  def this() = this(null, null)

  def getTarget: String = target

  def getDatapoints: Array[Array[Any]] = datapoints

}


object TimeSerieFixtures {
  val random = new scala.util.Random

  def random(start: Int, end: Int): Int = start + random.nextInt((end - start) + 1)

  def response(target: String): TimeSerieResponse = {

    val lst = Array.ofDim[Any](100, 2)
    for (x <- 0 to 99) {
      lst(x) = Array(random(1, 1000), Instant.now().minus(Duration.standardMinutes(x)).getMillis)
    }

    new TimeSerieResponse(target, lst)
  }
}