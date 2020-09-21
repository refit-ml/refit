package edu.cdl.iot.camel.transform

import com.sksamuel.pulsar4s.{ConsumerConfig, MessageId, PulsarClient, Subscription, Topic}
import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.yaml.PulsarConfig
import org.apache.camel.{Exchange, Processor}
import org.apache.pulsar.client.api.{Schema, SubscriptionType}

class PulsarProcessors(val config: PulsarConfig) {
  private val client = PulsarClient(config.host)
  private val topic = Topic(config.topics.predictions)
  private val consumerConfig = ConsumerConfig(
    Subscription("camel-subscription"),
    Seq(topic),
    subscriptionType = Option.apply(SubscriptionType.Shared)
  )
  private val consumer = client.consumer(consumerConfig)(Schema.BYTES)
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

  val ack: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val messageId: MessageId = exchange.getIn().getHeader(MESSAGE_ID_HEADER, classOf[MessageId])
      consumer.acknowledge(messageId)
    }
  }
}
