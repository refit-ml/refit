package edu.cdl.iot.ingestion.transform

import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import edu.cdl.iot.common.schema.factories.SchemaFactory
import edu.cdl.iot.common.util.{ConfigHelper, SensorDataHelper}
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.camel.{Exchange, Processor}
import org.apache.pulsar.client.api.Schema

object SenosrDataProcessors {
  private val host = ConfigHelper.env("PULSAR_HOST", "127.0.0.1")
  private val client = PulsarClient(s"pulsar://${host}:6650")
  private val producerTopic = Topic(s"persistent://sample/standalone/ns1/sensors")
  private val producerConfig = ProducerConfig(producerTopic)
  private val producer = client.producer(producerConfig)(Schema.BYTES)

  val sensorDataProducer: Processor = new Processor() {
    override def process(exchange: Exchange): Unit = {
      val schema = SchemaFactory.getSchema("baxter")
      val sensorData = SensorDataHelper.getRandomReadings(schema, includeLabels = true)
      exchange.getIn.setBody(sensorData)
    }
  }

  val sendToPulsar: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val sensorData = exchange.getIn.getBody(classOf[SensorData])
      println("Send sensor data")
      producer.send(sensorData.toByteArray)
      println("Sent")
    }
  }

}
