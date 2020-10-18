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
    properties
  }
}

class KafkaTopic(@BeanProperty var models: String,
                 @BeanProperty var data: String,
                 @BeanProperty var predictions: String,
                 @BeanProperty var `import`: String,
                 @BeanProperty var publishModels: String) extends Serializable {
  def this() {
    this(null, null, null, null, null)
  }
}