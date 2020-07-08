package org.example.data

import cdl.iot.SensorData.SensorData
import com.datastax.driver.mapping.annotations.{Column, Table}

@Table(keyspace = "iot-prototype", name = "sensor_data")
case class SensorDataModel(from: SensorData) {
  @Column(name = "sensorId")
  val sensorId: Int = from.sensorId

  @Column(name = "timestamp")
  val timestamp: String = from.timestamp

  @Column(name = "temperature")
  val temperature: Double = from.temperature

  @Column(name = "pressure")
  val pressure: Double = from.pressure

  @Column(name = "wind")
  val wind: Double = from.wind
}
