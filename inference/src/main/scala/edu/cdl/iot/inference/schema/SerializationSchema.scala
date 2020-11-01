package edu.cdl.iot.inference.schema

import java.lang

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.scala.DefaultScalaModule
import com.fasterxml.jackson.module.scala.experimental.ScalaObjectMapper
import org.apache.flink.streaming.connectors.kafka.{KafkaDeserializationSchema, KafkaSerializationSchema}
import org.apache.kafka.clients.producer.ProducerRecord

class SerializationSchema(topicName: String) extends KafkaSerializationSchema[rawInput] with KafkaDeserializationSchema[rawData]{

  val jacksonMapper = new ObjectMapper() with ScalaObjectMapper
  jacksonMapper.registerModule(DefaultScalaModule)

  def toJson(value: Any): String = {
    jacksonMapper.writeValueAsString(value)
  }

  def fromJson[T](json: String)(implicit m : Manifest[T]): T = {
    jacksonMapper.readValue[T](json)
  }

}

