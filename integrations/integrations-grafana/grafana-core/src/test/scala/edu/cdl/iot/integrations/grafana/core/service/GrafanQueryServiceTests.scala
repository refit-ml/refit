package edu.cdl.iot.integrations.grafana.core.service


import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

import edu.cdl.iot.integrations.grafana.core.request.QueryFilters

class GrafanQueryServiceTests extends AnyFlatSpec with should.Matchers {

  val projectGuid = "fake-project-guid"

  "Sensor ID Function" should "Return upper range" in {

    val testFilters = Array(QueryFilters(key = "sensor", operator = ">", value = "4") ,
      QueryFilters(key = "sensor", operator = ">", value = "12"),
      QueryFilters(key = "sensor", operator = ">", value = "8"))

    val output = getSensorIds(projectGuid, testFilters)
    val expected = List["13", "14", "15"]
    output should be (expected)
  }


  "it" should "Return equal values" in {

    val testFilters = Array(QueryFilters(key = "sensor", operator = "=", value = "4") ,
      QueryFilters(key = "sensor", operator = "=", value = "12"),
      QueryFilters(key = "sensor", operator = "=", value = "8"))

    val output = getSensorIds(projectGuid, testFilters)
    val expected = List["4", "8", "12"]
    output should be (expected)

  }

  "Sensor ID Function" should "Return lower range" in {

    val testFilters = Array(QueryFilters(key = "sensor", operator = "<", value = "4") ,
      QueryFilters(key = "sensor", operator = "<", value = "12"),
      QueryFilters(key = "sensor", operator = "<", value = "8"))

    val output = getSensorIds(projectGuid, testFilters)
    val expected = List["1", "2", "3"]
    output should be (expected)
  }



}