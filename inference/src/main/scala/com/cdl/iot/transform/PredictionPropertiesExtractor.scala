package com.cdl.iot.transform

import java.util

import cdl.iot.dto.Prediction.Prediction
import org.apache.flink.streaming.connectors.pulsar.partitioner.PulsarPropertiesExtractor

import collection.JavaConverters.mapAsJavaMapConverter

class PredictionPropertiesExtractor extends PulsarPropertiesExtractor[Prediction] {
  override def getProperties(in: Prediction): util.Map[String, String] = Map[String, String](
    "sensorId" -> in.sensorId.toString,
    "timestamp" -> in.timestamp,
    "modelGuid" -> in.modelGuid
  ).asJava
}
