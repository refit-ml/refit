package cdl.iot.actions

import java.util.Properties

import cdl.iot.dao.ModelDao
import cdl.iot.dto.Model.Model
import com.google.protobuf.ByteString
import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import org.apache.pulsar.client.api.Schema
import org.skife.jdbi.v2.{DBI, Handle}

object Models {

  def getModel(host: String, user: String, password: String, version: String): Model = {
    val props = new Properties()
    props.setProperty("user", user)
    props.setProperty("password", password)
    val jdbi = new DBI(s"jdbc:cassandra://${host}:9160/iot_prototype_training", props)

    jdbi.withHandle[Model]((handle: Handle) => {
      val dao = handle.attach(classOf[ModelDao])
      Model(version, ByteString.copyFrom(dao.getModel(version).get(0)))
    })
  }

  def sendModel(client: PulsarClient, host: String, username: String, password: String, modelVersion: String, namespace: String, topicName: String): Unit = {
    val schema: Schema[Array[Byte]] = Schema.BYTES
    val topic: Topic = Topic(s"persistent://sample/standalone/${namespace}/${topicName}")
    val producerConfig = ProducerConfig(topic)
    val producer = client.producer[Array[Byte]](producerConfig)(schema)

    val model = getModel(host, username, password, modelVersion)
    println(s"Sending Model ${model.key}")
    producer.send(model.toByteArray)
    println("Sent")
    producer.close()
  }

}
