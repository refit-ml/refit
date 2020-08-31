package edu.cdl.iot.ingestion.transform

import com.sksamuel.pulsar4s.{ConsumerConfig, MessageId, ProducerConfig, PulsarClient, Subscription, Topic}
import edu.cdl.iot.common.util.ConfigHelper
import edu.cdl.iot.protocol.Model.Model
import org.apache.camel.{Exchange, Processor}
import org.apache.pulsar.client.api.{Schema, SubscriptionType}

object PulsarProcessors {
  private val host = ConfigHelper.env("PULSAR_HOST", "127.0.0.1")
  private val client = PulsarClient(s"pulsar://${host}:6650")
  private val topic = Topic("persistent://sample/standalone/ns1/model-training")
  private val consumerConfig = ConsumerConfig(
    Subscription("ingestion-subscription"),
    Seq(topic),
    subscriptionType = Option.apply(SubscriptionType.Shared)
  )
  private val producerTopic = Topic(s"persistent://sample/standalone/ns1/models")
  private val producerConfig = ProducerConfig(producerTopic)
  private val consumer = client.consumer(consumerConfig)(Schema.BYTES)
  private val producer = client.producer(producerConfig)(Schema.BYTES)

  private val MESSAGE_ID_HEADER = "PULSAR_MESSAGE_ID"

  val produceMessages: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val response = consumer.receive
      if (response.isSuccess && response.get != null) {
        val message = response.get
        exchange.getIn.setBody(message.data)
        exchange.getIn.setHeader(MESSAGE_ID_HEADER, message.messageId)
      }
    }
  }

  val sendModels: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val models = exchange.getIn.getBody(classOf[List[Model]])
      println(s"Sending ${models.length} models")
      models
        .map(x => x.toByteArray)
        .map(producer.send)
      println("Models sent")

    }
  }

  val ack: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val messageId: MessageId = exchange.getIn().getHeader(MESSAGE_ID_HEADER, classOf[MessageId])
      consumer.acknowledge(messageId)
    }
  }
}
