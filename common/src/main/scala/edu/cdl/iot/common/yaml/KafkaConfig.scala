package edu.cdl.iot.common.yaml

import java.util.Properties

import scala.beans.BeanProperty

class KafkaConfig(@BeanProperty var host: String,
                  @BeanProperty var topics: KafkaTopic) extends Serializable {
  def this() {
    this(null, null)
  }

  def getProperties(consumerGroup: String): Properties = {
    val properties = new Properties
    properties.put("bootstrap.servers", host)
    properties.put("key.deserializer", "org.apache.kafka.common.serialization.ByteArrayDeserializer")
    properties.put("value.deserializer", "org.apache.kafka.common.serialization.ByteArrayDeserializer")
    properties.put("key.serializer", "org.apache.kafka.common.serialization.ByteArraySerializer")
    properties.put("value.serializer", "org.apache.kafka.common.serialization.ByteArraySerializer")
    properties.put("auto.offset.reset", "latest")
    properties.put("group.id", consumerGroup)
    properties.put("transaction.timeout.ms", "900000")
    properties
  }
}

class KafkaTopic(@BeanProperty var modelPublished: String,
                 @BeanProperty var data: String,
                 @BeanProperty var predictions: String,
                 @BeanProperty var `import`: String,
                 @BeanProperty var rawSensorData: String,
                 @BeanProperty var sensorData: String
                ) extends Serializable {
  def this() {
    this(null, null, null, null, null, null)
  }
}