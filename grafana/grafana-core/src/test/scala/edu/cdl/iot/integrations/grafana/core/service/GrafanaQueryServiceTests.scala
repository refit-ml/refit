package edu.cdl.iot.integrations.grafana.core.service


import java.util.UUID

import edu.cdl.iot.common.domain.{Project, Sensor}
import edu.cdl.iot.integrations.grafana.core.repository.{GrafanaProjectRepository, GrafanaSensorDataRepository, GrafanaSensorRepository}
import edu.cdl.iot.integrations.grafana.core.request.QueryFilters
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

class GrafanaQueryServiceTests extends AnyFlatSpec with should.Matchers {


  private val fakeProjectRepo = new GrafanaProjectRepository {
    override def find(projectGuid: UUID): Project = ???

    override def find: List[Project] = ???

    override def save(project: Project): Unit = ???
  }

  private val fakeSensorRepo = new GrafanaSensorRepository {
    override def findAll: List[String] = ???

    override def findAll(projectGuid: String): List[String] = List.range(1, 101).map(_.toString)

    override def save(sensors: Seq[Sensor]): Unit = ???
  }

  private val fakeSensorDataRepo = new GrafanaSensorDataRepository {
    override def find(projectGuid: String, sensorId: String, partitions: List[String]): List[Map[String, String]] = ???
  }

  private val projectGuid = "fake-project-guid"


  private val testLowerFilters = Array(new QueryFilters(key = "sensor", operator = "<", value = "82"),
    new QueryFilters(key = "sensor", operator = "<", value = "14"),
    new QueryFilters(key = "sensor", operator = "<", value = "48"))

  "Sensor ID Function" should "Return lower values" in {
    val actual = new GrafanaQueryService(fakeProjectRepo, fakeSensorRepo, fakeSensorDataRepo).getSensorIds(projectGuid, testLowerFilters)
    val expected = List.range(1, 14).map(_.toString)
    actual should be (expected)
  }


  private val testGreaterFilters = Array(new QueryFilters(key = "sensor", operator = ">", value = "14"),
    new QueryFilters(key = "sensor", operator = ">", value = "48"),
    new QueryFilters(key = "sensor", operator = ">", value = "82"))

  "Sensor ID Function" should "Return greater values" in {
    val actual = new GrafanaQueryService(fakeProjectRepo, fakeSensorRepo, fakeSensorDataRepo).getSensorIds(projectGuid, testGreaterFilters)
    val expected = List.range(83, 101).map(_.toString)
    actual should be (expected)
  }


   private val testEqualFilters = Array(new QueryFilters(key = "sensor", operator = "=", value = "82"),
    new QueryFilters(key = "sensor", operator = "=", value = "14"),
    new QueryFilters(key = "sensor", operator = "=", value = "48"))

    "Sensor ID Function" should "Return exact values" in {
    val actual = new GrafanaQueryService(fakeProjectRepo, fakeSensorRepo, fakeSensorDataRepo).getSensorIds(projectGuid, testEqualFilters)
    val expected = List(82, 14, 48).map(_.toString)
    actual should be (expected)
  }

  private val testBadFilter = Array(new QueryFilters(key = "sensor", operator = "<>", value = "82"),
    new QueryFilters(key = "sensor", operator = ">=", value = "14"),
    new QueryFilters(key = "sensor", operator = "==", value = "48"))

  "Sensor ID Function" should "Return all values" in {
    val actual = new GrafanaQueryService(fakeProjectRepo, fakeSensorRepo, fakeSensorDataRepo).getSensorIds(projectGuid, testBadFilter)
    val expected = List.range(1, 101).map(_.toString)//List.range(13, 16).map(_.toString)
    actual should be (expected)
  }

}
