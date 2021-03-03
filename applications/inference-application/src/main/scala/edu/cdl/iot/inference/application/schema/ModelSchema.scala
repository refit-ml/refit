package edu.cdl.iot.inference.application.schema

import edu.cdl.iot.protocol.Model.Model
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation

class ModelSchema extends DeserializationSchema[Model] with SerializationSchema[Model] {
  override def deserialize(message: Array[Byte]): Model = Model.parseFrom(message)

  override def isEndOfStream(nextElement: Model): Boolean = false

  override def getProducedType: TypeInformation[Model] = TypeInformation.of(classOf[Model])

  override def serialize(element: Model): Array[Byte] = element.toByteArray
}
