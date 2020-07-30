package edu.cdl.iot.db.reset.dto

case class SensorData(
                       key: String,
                       timestamp: String,
                       data: Map[String, String],
                       prediction: Map[String, String]
                     )