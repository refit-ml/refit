import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import org.apache.pulsar.client.api.Schema
import java.time.LocalDateTime

import scala.util.Random
import scala.io.Source
import cdl.iot.SensorData.SensorData

//sensor_id,timestamp,temperature,pressure,wind
//@SerialVersionUID(100L)
//class SensorData(sensor_id: Int, _timestamp: String, _temperature: Int, _pressure: Int, _wind: Int)
// extends Serializable{
//  val id: Int = sensor_id
//  val timestamp: String = _timestamp
//  val temperature: Int = _temperature
//  val pressure: Int = _pressure
//  val wind: Int = _wind
//}
object Main {

  def main(args: Array[String]) {

    val src = Source.fromFile(s"${System.getProperty("user.dir")}/sensor_data.csv")
    val iter = src.getLines()
      .drop(1)
      .map(_.split(","))
      .map(x => new SensorData(x(0).toInt, x(1), x(2).toDouble, x(3).toDouble, x(4).toDouble))

    val client = PulsarClient("pulsar://localhost:6650")

    val currTime = LocalDateTime.now()

    def lst: LazyList[SensorData] = {
      def loop(v: Int): LazyList[SensorData] = {
        new SensorData(Random.between(5000, 5005), (currTime.plusSeconds(v)).toString(), Random.between(30, 101), Random.between(900, 1201), Random.between(0, 70)) #:: loop(v + 5)
      }
      loop(0)
    }

    val schema = Schema.BYTES

    val topic = Topic("persistent://sample/standalone/default/in")
    val producerConfig = ProducerConfig(topic)
    val producer = client.producer[Array[Byte]](producerConfig)(schema)

    print("Begin sending messages")
    lst.foreach(x => {
      print(s"\nSend message: ${x.sensorId} ${x.timestamp} ${x.temperature} ${x.pressure} ${x.wind}\n")
      producer.send(x.toByteArray)
      Thread.sleep(5000)
    })

    producer.close()
    client.close()
  }
}
