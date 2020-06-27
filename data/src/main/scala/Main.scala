import com.sksamuel.pulsar4s.{ConsumerConfig, ConsumerMessage, Message, ProducerConfig, PulsarClient, Subscription, Topic}
import org.apache.pulsar.client.api.Schema

import scala.io.Source

//sensor_id,timestamp,temperature,pressure,wind
@SerialVersionUID(100L)
class SensorData(sensor_id: Int, _timestamp: String, _temperature: Int, _pressure: Int, _wind: Int)
 extends Serializable{
  val id: Int = sensor_id
  val timestamp: String = _timestamp
  val temperature: Int = _temperature
  val pressure: Int = _pressure
  val wind: Int = _wind
}

object Main {
  def main(args: Array[String]) {
    val src = Source.fromFile(s"${System.getProperty("user.dir")}/sensor_data.csv")
    val iter = src.getLines()
      .drop(1)
      .map(_.split(","))
      .map(x => new SensorData(x(0).toInt, x(1), x(2).toInt, x(3).toInt, x(4).toInt))

    val client = PulsarClient("pulsar://localhost:6650")

    implicit val schema: Schema[String] = Schema.STRING

    val topic = Topic("persistent://sample/standalone/ns1/u")
    val producerConfig = ProducerConfig(topic)
    val producer = client.producer[String](producerConfig)

    print("Begin sending messages")
    iter.foreach(x => {
      print(s"\nSend message: ${x.id}\n")
      producer.send(x.temperature.toString)
    })

    producer.close()
    client.close()
  }
}