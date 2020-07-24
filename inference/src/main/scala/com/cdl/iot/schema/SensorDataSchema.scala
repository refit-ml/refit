package com.cdl.iot.schema

import cdl.iot.dto.SensorData.SensorData
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation

class SensorDataSchema extends SerializationSchema[SensorData] with DeserializationSchema[SensorData] {
  override def serialize(element: SensorData): Array[Byte] = element.toProtoString.getBytes

  override def deserialize(message: Array[Byte]): SensorData = SensorData.parseFrom(message)

  override def isEndOfStream(nextElement: SensorData): Boolean = true

  override def getProducedType: TypeInformation[SensorData] = TypeInformation.of(classOf[SensorData])
}
