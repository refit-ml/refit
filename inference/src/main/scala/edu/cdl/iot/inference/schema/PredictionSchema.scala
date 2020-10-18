package edu.cdl.iot.inference.schema

import java.lang

import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation
import org.apache.flink.streaming.connectors.kafka.KafkaSerializationSchema
import org.apache.kafka.clients.producer.ProducerRecord

class PredictionSchema(topicName: String) extends KafkaSerializationSchema[Prediction] with DeserializationSchema[Prediction] {

  private def getElementKey(element: Prediction): Array[Byte] = s"${element.projectGuid}_${element.sensorId}_${element.timestamp}".getBytes()

  override def deserialize(message: Array[Byte]): Prediction = Prediction.parseFrom(message)

  override def isEndOfStream(nextElement: Prediction): Boolean = true

  override def getProducedType: TypeInformation[Prediction] = TypeInformation.of(classOf[Prediction])

  override def serialize(element: Prediction, timestamp: lang.Long): ProducerRecord[Array[Byte], Array[Byte]] =
    new ProducerRecord[Array[Byte], Array[Byte]](topicName, element.toByteArray)
}
