package com.cdl.iot.transform

import cdl.iot.dto.SensorData.SensorData
import org.apache.flink.streaming.connectors.pulsar.TopicKeyExtractor

class SensorDataKeyExtractor extends TopicKeyExtractor[SensorData] {
  override def serializeKey(element: SensorData): Array[Byte] = s"${element.timestamp}_${element.sensorId}".getBytes()

  override def getTopic(element: SensorData): String = "persistent://public/standalone/default/event-log"
}
