package edu.cdl.iot.camel.dto

import java.util

import org.joda.time.{Duration, Instant}

import scala.util.Random

class TimeSerieResponse(target: String,
                        datapoints: Array[Array[Any]]) {

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