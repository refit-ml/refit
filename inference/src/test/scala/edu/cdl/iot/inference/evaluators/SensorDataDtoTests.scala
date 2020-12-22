package edu.cdl.iot.inference.evaluators

import java.time.Instant
import java.util.UUID

import com.google.gson.Gson
import edu.cdl.iot.inference.SensorDataDto
import edu.cdl.iot.protocol.SensorData.SensorData
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should


class SensorDataDtoTests extends AnyFlatSpec with should.Matchers {
  private val gson = new Gson()

  private val projectGuid = UUID.randomUUID().toString
  private val sensorId = UUID.randomUUID().toString
  private val timestamp = Instant.now().toString
  private val sensorData = new SensorData(
    projectGuid,
    sensorId,
    timestamp,
    Map("double1" -> 0.0),
    Map("string1" -> "asdf"),
    Map("int1" -> 1),
    Map("label1" -> "asdf")
  )


  "SensorDataDto" should "Convert from SensorData" in {
    val dto = SensorDataDto.of(sensorData)

    dto should not be null
    assert(dto.projectGuid === projectGuid)
    assert(dto.sensorId === sensorId)
    assert(dto.timestamp === timestamp)
  }

  "SensorDataDto" should "Serialize to JSON" in {
    val dto = SensorDataDto.of(sensorData)
    val json = gson.toJson(dto)
    json should not be null
  }

  "SensorDataDto" should "De-Serialize from JSON" in {
    val expected = SensorDataDto.of(sensorData)
    val json = gson.toJson(expected)
    val actual = gson.fromJson(json, classOf[SensorDataDto])

    assert(expected === actual)
  }

  "SensorDataDto" should "De-Serialize from JSON to SensorData" in {
    val expected = sensorData
    val json = gson.toJson(SensorDataDto.of(expected))
    val dto = gson.fromJson(json, classOf[SensorDataDto])
    val actual = SensorDataDto.toSensorData(dto)

    actual should not be null
    assert(actual.doubles === expected.doubles)
    assert(actual.integers === expected.integers)
    assert(actual.strings === expected.strings)
    assert(actual.labels === expected.labels)

  }


}
