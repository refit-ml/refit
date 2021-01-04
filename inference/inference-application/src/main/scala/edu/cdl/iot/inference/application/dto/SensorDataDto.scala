package edu.cdl.iot.inference.application.dto

import com.fasterxml.jackson.databind.ObjectMapper
import edu.cdl.iot.protocol.SensorData.SensorData

import scala.beans.BeanProperty
import scala.collection.JavaConverters.{asJavaIterableConverter, mapAsScalaMapConverter}


case class SensorDataDto(@BeanProperty projectGuid: String,
                         @BeanProperty sensorId: String,
                         @BeanProperty timestamp: String,
                         @BeanProperty doubles: String,
                         @BeanProperty strings: String,
                         @BeanProperty integers: String,
                         @BeanProperty labels: String)


object SensorDataDto {
  @transient private lazy val mapper = new ObjectMapper()
  @transient private lazy val doubleClass = classOf[java.util.HashMap[String, Double]]
  @transient private lazy val stringClass = classOf[java.util.HashMap[String, String]]
  @transient private lazy val integerClass = classOf[java.util.HashMap[String, Int]]

  def of(sensorData: SensorData): SensorDataDto =
    SensorDataDto(sensorData.projectGuid,
      sensorData.sensorId,
      sensorData.timestamp,
      mapper.writeValueAsString(sensorData.doubles.asJava),
      mapper.writeValueAsString(sensorData.strings.asJava),
      mapper.writeValueAsString(sensorData.integers.asJava),
      mapper.writeValueAsString(sensorData.labels.asJava))

  def toSensorData(dto: SensorDataDto): SensorData =
    new SensorData(dto.projectGuid,
      dto.sensorId,
      dto.timestamp,
      mapper.readValue(dto.doubles, doubleClass).asScala.toMap,
      mapper.readValue(dto.strings, stringClass).asScala.toMap,
      mapper.readValue(dto.integers, integerClass).asScala.toMap,
      mapper.readValue(dto.labels, stringClass).asScala.toMap)
}
