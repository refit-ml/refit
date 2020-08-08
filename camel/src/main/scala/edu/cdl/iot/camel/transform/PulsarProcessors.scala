package edu.cdl.iot.camel.transform

import com.sksamuel.pulsar4s.{ConsumerConfig, MessageId, PulsarClient, Subscription, Topic}
import org.apache.camel.Exchange
import org.apache.pulsar.client.api.Schema

object PulsarProcessors {
  private val client = PulsarClient(s"pulsar://127.0.0.1:6650")
  private val topic = Topic("persistent://sample/standalone/ns1/sensors")
  private val config = ConsumerConfig(
    Subscription("camel-subs"),
    Seq(topic)
  )
  private val consumer = client.consumer(config)(Schema.BYTES)
  private val MESSAGE_ID_HEADER = "PULSAR_MESSAGE_ID"

  def produceMessages: Exchange => Unit = (exchange: Exchange) => {
    val response = consumer.receive
    if (response.isSuccess && response.get != null) {
      val message = response.get
      exchange.getIn.setBody(message.data)
      exchange.getIn.setHeader(MESSAGE_ID_HEADER, message.messageId)
    }
  }

  def ack: Exchange => Unit = (exchange: Exchange) => {
    val messageId: MessageId = exchange.getIn().getHeader(MESSAGE_ID_HEADER, classOf[MessageId])
    consumer.acknowledge(messageId)
  }
}
