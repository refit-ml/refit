package edu.cdl.iot.ingestion.actions

import com.google.protobuf.ByteString
import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import edu.cdl.iot.ingestion.dao.ModelDao
import edu.cdl.iot.protocol.Model.Model
import org.apache.pulsar.client.api.Schema

object Models {

  def getModel(host: String, user: String, password: String, projectGuid: String, modelGuid: String): Model = {

    val model = new Model(projectGuid,
      modelGuid,
      ByteString.copyFrom(ModelDao.getModel(projectGuid, modelGuid))
    )
    model
  }

  def sendModel(client: PulsarClient, host: String, username: String, password: String, modelVersion: String, namespace: String, topicName: String): Unit = {
    val schema: Schema[Array[Byte]] = Schema.BYTES
    val topic: Topic = Topic(s"persistent://sample/standalone/$namespace/$topicName")
    val producerConfig = ProducerConfig(topic)
    val producer = client.producer[Array[Byte]](producerConfig)(schema)
    val projectGuid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"

    val model = getModel(host, username, password, projectGuid, modelVersion)
    println(s"Sending Model ${model.key}")
    producer.send(model.toByteArray)
    println("Sent")
    producer.close()
  }

}
