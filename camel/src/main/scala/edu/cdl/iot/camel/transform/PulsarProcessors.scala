package edu.cdl.iot.camel.transform

import com.sksamuel.pulsar4s.{ConsumerConfig, MessageId, PulsarClient, Subscription, Topic}
import edu.cdl.iot.common.util.ConfigHelper
import org.apache.camel.{Exchange, Processor}
import org.apache.pulsar.client.api.Schema

object PulsarProcessors {
  private val host = ConfigHelper.env("PULSAR_HOST", "127.0.0.1")
  private val client = PulsarClient(s"pulsar://${host}:6650")
  private val topic = Topic("persistent://sample/standalone/ns1/predictions")
  private val config = ConsumerConfig(
    Subscription("camel-subs"),
    Seq(topic)
  )
  private val consumer = client.consumer(config)(Schema.BYTES)
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
