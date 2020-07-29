package edu.cdl.iot.ingestion.actions

import java.util.Properties

import com.google.protobuf.ByteString
import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import edu.cdl.iot.ingestion.dao.ModelDao
import edu.cdl.iot.protocol.Model.Model
import org.apache.pulsar.client.api.Schema
import org.skife.jdbi.v2.{DBI, Handle}

object Models {

  def getModel(host: String, user: String, password: String, version: String): Model = {
    val props = new Properties()
    props.setProperty("user", user)
    props.setProperty("password", password)
    val jdbi = new DBI(s"jdbc:cassandra://${host}:9160/iot_prototype_training", props)
    val h = jdbi.open()
    val dao = h.attach(classOf[ModelDao])
    val model = new Model(version, ByteString.copyFrom(dao.getModel(version).get(0)))
    h.close()
    model
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
