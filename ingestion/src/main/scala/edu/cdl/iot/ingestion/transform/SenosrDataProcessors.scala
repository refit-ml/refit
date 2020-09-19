package edu.cdl.iot.ingestion.transform

import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.util.SensorDataHelper
import edu.cdl.iot.common.yaml.PulsarConfig
import edu.cdl.iot.ingestion.dao.ModelDao
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.camel.{Exchange, Processor}

// This is a class to just produce fake data
class SenosrDataProcessors(config: PulsarConfig,
                           modelDao: ModelDao) {
  private val client = PulsarClient(config.host)
  private val producerTopic = Topic(config.topics.models)

  private val projectGuid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"

  private val producerConfig = ProducerConfig(producerTopic)
  private val producer = client.producer(producerConfig)(org.apache.pulsar.client.api.Schema.BYTES)

  private val sensors = (1000 to 1100).toList

  val schemaProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val schema = modelDao.getProjectSchema(projectGuid)
      exchange.getIn.setHeader("SCHEMA", schema)
    }
  }

  val sensorDataProducer: Processor = new Processor() {
    override def process(exchange: Exchange): Unit = {
      val schema = exchange.getIn.getHeader("SCHEMA").asInstanceOf[Schema]
      val sensorReadings = sensors.map(sensorId => SensorDataHelper.getRandomReadings(schema, sensorId.toString))

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
