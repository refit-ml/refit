package edu.cdl.iot.inference

import java.lang

import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.flink.streaming.connectors.kafka.{KafkaDeserializationSchema, KafkaSerializationSchema}
import org.apache.kafka.clients.producer.ProducerRecord

case class ObjectModule() extends KafkaSerializationSchema with KafkaDeserializationSchema{


  override def serialize(element: rawData): ProducerRecord[Array[Byte], Array[Byte]] =
    new ProducerRecord[Array[Byte], Array[Byte]](topicName, element.to)
}
