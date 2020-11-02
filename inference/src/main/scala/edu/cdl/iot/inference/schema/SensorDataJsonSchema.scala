package edu.cdl.iot.inference.schema


import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.scala.DefaultScalaModule
import com.fasterxml.jackson.module.scala.experimental.ScalaObjectMapper
import com.google.gson.Gson
import edu.cdl.iot.inference.SensorDataDto
import edu.cdl.iot.inference.SensorDataDto.toSensorData
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation

class SensorDataJsonSchema extends SerializationSchema[SensorData] with DeserializationSchema[SensorData] {

  @transient lazy val gson = {
    new Gson
  }


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

