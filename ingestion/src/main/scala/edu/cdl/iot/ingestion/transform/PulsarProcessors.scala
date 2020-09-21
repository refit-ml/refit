package edu.cdl.iot.ingestion.transform

import com.sksamuel.pulsar4s.{ConsumerConfig, MessageId, ProducerConfig, PulsarClient, Subscription, Topic}
import edu.cdl.iot.common.yaml.PulsarConfig
import edu.cdl.iot.ingestion.constants.PulsarConstants
import edu.cdl.iot.protocol.Model.Model
import org.apache.camel.{Exchange, Processor}
import org.apache.pulsar.client.api.{Schema, SubscriptionType}

class PulsarProcessors(private val config: PulsarConfig) {
  private val client = PulsarClient(config.host)
  // TODO: We need to make all the parts of pulsar a part of the RefitConfig
  private val topic = Topic(config.topics.publishModels)
  private val consumerConfig = ConsumerConfig(
    Subscription(PulsarConstants.SUBSCRIPTION_NAME),
    Seq(topic),
    subscriptionType = Option.apply(SubscriptionType.Shared)
  )
  private val producerTopic = Topic(config.topics.models)
  private val producerConfig = ProducerConfig(producerTopic)
  private val consumer = client.consumer(consumerConfig)(Schema.BYTES)
  private val producer = client.producer(producerConfig)(Schema.BYTES)

  val consumeModelUpdates: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val response = consumer.receive
      if (response.isSuccess && response.get != null) {
        val message = response.get
        exchange.getIn.setBody(message.data)
        exchange.getIn.setHeader(PulsarConstants.MESSAGE_ID_HEADER, message.messageId)
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
      val messageId: MessageId = exchange.getIn().getHeader(PulsarConstants.MESSAGE_ID_HEADER, classOf[MessageId])
      consumer.acknowledge(messageId)
    }
  }
}
