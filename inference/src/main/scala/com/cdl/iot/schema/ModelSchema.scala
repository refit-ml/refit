package com.cdl.iot.schema

import cdl.iot.dto.Model.Model
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation
import org.apache.flink.streaming.api.scala.createTypeInformation

class ModelSchema extends DeserializationSchema[Model] {
  override def deserialize(message: Array[Byte]): Model = {
    val ret = Model.parseFrom(message)
    ret
  }

  override def isEndOfStream(nextElement: Model): Boolean = true

  override def getProducedType: TypeInformation[Model] = createTypeInformation[Model]

//  override def serialize(element: Model): Array[Byte] = element.toByteArray
}
