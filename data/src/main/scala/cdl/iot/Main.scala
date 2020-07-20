package cdl.iot

import java.time.LocalDateTime
import java.util.Properties

import cdl.iot.dao.ModelDao
import cdl.iot.dto.Model.Model
import cdl.iot.dto.SensorData.SensorData
import com.google.protobuf.ByteString
import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import org.apache.pulsar.client.api.Schema
import org.skife.jdbi.v2.{DBI, Handle}
import org.skife.jdbi.v2.tweak.HandleCallback

import scala.util.Random

object Main {

  def env(name: String, default: String): String = if (sys.env.contains(name)) sys.env(name) else default


  def getModel(host: String, user: String, password: String, version: String): Model = {
    val props = new Properties()
    props.setProperty("user", user)
    props.setProperty("password", password)
    val jdbi = new DBI(s"jdbc:cassandra://${host}:9160/iot_prototype_training", props)

    jdbi.withHandle[Model](new HandleCallback[Model]() {
      override def withHandle(handle: Handle): Model = {
        val dao = handle.attach(classOf[ModelDao])
        Model("asdf", ByteString.copyFrom(dao.getModel(version).get(0)))
      }
    })
  }

  def sendModel(client: PulsarClient, host: String, username: String, password: String, modelVersion: String, namespace: String, topicName: String): Unit = {
    val schema = Schema.BYTES
    val topic = Topic(s"persistent://sample/standalone/${namespace}/${topicName}")
    val producerConfig = ProducerConfig(topic)
    val producer = client.producer[Array[Byte]](producerConfig)(schema)

    val model = getModel(host, username, password, modelVersion)
    println(s"Sending Model ${model.key}")
    producer.send(model.toByteArray)
    println("Sent")
    producer.close()
  }

  def main(args: Array[String]) {
    val sleepIntervalMils = env("INTERVAL_MILS", "5000").toInt
    val hostName = env("PULSAR_HOST", "localhost")
    val topicName = env("TOPIC_NAME", "in")
    val modelTopic = env("MODEL_TOPIC", "models")
    val namespace = env("NAMESPACE_NAME", "default")
    val cassandraHost = env("CASSANDRA_HOST", "127.0.0.1")
    val cassandraUsername = env("CASSANDRA_USER", "cassandra")
    val cassandraPassword = env("CASSANDRA_PASSWORD", "cassandra")
    val modelVersion = env("MODEL_VERSION", "__latest__")


    val client = PulsarClient(s"pulsar://${hostName}:6650")
    sendModel(client, cassandraHost, cassandraUsername, cassandraPassword, modelVersion, namespace, modelTopic)

    val currTime = LocalDateTime.now()

    def lst: LazyList[SensorData] = {
      def loop(v: Int): LazyList[SensorData] = {
        val timestamp = currTime.plusSeconds(v)
        new SensorData(Random.between(5000, 5005),
          timestamp.toString,
          Map(
            "wind" -> Random.between(30, 101).toDouble,
            "pressure" -> Random.between(900, 1201).toDouble,
            "temperature" -> Random.between(0, 70).toDouble
          ),
          Map(
            "timestamp" -> timestamp.toString
          ),
          Map(
            "hour" -> timestamp.getHour
          )
        ) #:: loop(v + 5)
      }

      loop(0)
    }

    val schema = Schema.BYTES
    val topic = Topic(s"persistent://sample/standalone/${namespace}/${topicName}")
    val producerConfig = ProducerConfig(topic)
    val producer = client.producer[Array[Byte]](producerConfig)(schema)

    print("Begin sending messages")
    lst.foreach(x => {
      print(s"\nSend message: ${x.sensorId} ${x.timestamp} ${x.doubles} ${x.integers} ${x.strings}\n")
      producer.send(x.toByteArray)
      Thread.sleep(sleepIntervalMils)
    })

    producer.close()
    client.close()
  }
}
