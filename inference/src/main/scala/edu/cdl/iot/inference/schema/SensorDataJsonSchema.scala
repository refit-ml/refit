package edu.cdl.iot.inference.schema


import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.scala.DefaultScalaModule
import com.fasterxml.jackson.module.scala.experimental.ScalaObjectMapper
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation

class SensorDataJsonSchema extends SerializationSchema[SensorData] with DeserializationSchema[SensorData] {

  private val mapper = new ObjectMapper() with ScalaObjectMapper
  mapper.registerModule(DefaultScalaModule)

  override def serialize(element: SensorData): Array[Byte] = mapper.writeValueAsBytes(element)

  override def deserialize(message: Array[Byte]): SensorData = mapper.readValue(message)

  override def isEndOfStream(nextElement: SensorData): Boolean = false

  override def getProducedType: TypeInformation[SensorData] = TypeInformation.of(classOf[SensorData])
}

