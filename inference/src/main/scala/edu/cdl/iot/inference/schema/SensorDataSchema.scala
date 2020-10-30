package edu.cdl.iot.inference.schema

import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation

class SensorDataSchema extends DeserializationSchema[SensorData] with SerializationSchema[SensorData] {

  override def isEndOfStream(nextElement: SensorData): Boolean = false

  override def getProducedType: TypeInformation[SensorData] = TypeInformation.of(classOf[SensorData])

  override def deserialize(message: Array[Byte]): SensorData = {
    val ret = SensorData.parseFrom(message)
    println("Sensor data recieved")
    ret

  }

  override def serialize(element: SensorData): Array[Byte] = element.toByteArray
}
