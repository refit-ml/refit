package edu.cdl.iot.ingestion.transform

import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.util.{ConfigHelper, SensorDataHelper}
import edu.cdl.iot.ingestion.dao.ModelDao
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.camel.{Exchange, Processor}

object SenosrDataProcessors {
  private val host = ConfigHelper.env("PULSAR_HOST", "127.0.0.1")
  private val client = PulsarClient(s"pulsar://${host}:6650")
  private val producerTopic = Topic(s"persistent://sample/standalone/ns1/sensors")
  private val producerConfig = ProducerConfig(producerTopic)
  private val producer = client.producer(producerConfig)(org.apache.pulsar.client.api.Schema.BYTES)

  private val sensors = (1000 to 1100).toList

  val schemaProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val projectGuid = ConfigHelper.env("PROJECT_GUID", "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f")
      val schema = ModelDao.getProjectSchema(projectGuid)
      exchange.getIn.setHeader("SCHEMA", schema)
    }
  }

  val sensorDataProducer: Processor = new Processor() {
    override def process(exchange: Exchange): Unit = {
      val schema = exchange.getIn.getHeader("SCHEMA").asInstanceOf[Schema]
      val sensorReadings = sensors.map( sensorId => SensorDataHelper.getRandomReadings(schema, sensorId.toString))

      exchange.getIn.setBody(sensorReadings)
    }
  }

  val sendToPulsar: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val sensorReadings = exchange.getIn.getBody(classOf[List[SensorData]])
      println("Send sensor data")
      sensorReadings.map(x => x.toByteArray)
          .foreach(producer.send)
      println("Sent")
    }
  }

}
