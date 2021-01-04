package edu.cdl.iot.inference.application.schema

import com.google.gson.Gson
import edu.cdl.iot.inference.application.dto.SensorDataDto
import edu.cdl.iot.inference.application.dto.SensorDataDto.toSensorData
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation

class SensorDataJsonSchema extends SerializationSchema[SensorData] with DeserializationSchema[SensorData] {

  @transient private lazy val gson = new Gson

  override def serialize(element: SensorData): Array[Byte] = {
    val dto = SensorDataDto.of(element)
    val s = gson.toJson(dto)
    s.getBytes
  }

  override def deserialize(message: Array[Byte]): SensorData = {
    val dto = gson.fromJson(new String(message), classOf[SensorDataDto])
    val res = toSensorData(dto)
    res
  }

  override def isEndOfStream(nextElement: SensorData): Boolean = false

  override def getProducedType: TypeInformation[SensorData] = TypeInformation.of(classOf[SensorData])
}

