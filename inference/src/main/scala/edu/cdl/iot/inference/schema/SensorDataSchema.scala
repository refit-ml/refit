package edu.cdl.iot.inference.schema

import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation
import org.apache.flink.streaming.connectors.kafka.{KafkaDeserializationSchema, KafkaSerializationSchema}
import org.apache.kafka.clients.consumer.ConsumerRecord

class SensorDataSchema extends KafkaDeserializationSchema[SensorData] {

  //  override def deserialize(message: Array[Byte]): SensorData = {
  //    val ret = SensorData.parseFrom(message)
  //    println("Sensor data recieved")
  //    ret
  //  }

  override def isEndOfStream(nextElement: SensorData): Boolean = false

  override def getProducedType: TypeInformation[SensorData] = TypeInformation.of(classOf[SensorData])

  override def deserialize(record: ConsumerRecord[Array[Byte], Array[Byte]]): SensorData = {
    val ret = SensorData.parseFrom(record.value())
    println("Sensor data recieved")
    ret
  }
}
