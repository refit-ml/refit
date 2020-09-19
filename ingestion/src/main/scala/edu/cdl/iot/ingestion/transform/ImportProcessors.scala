package edu.cdl.iot.ingestion.transform

import com.sksamuel.pulsar4s.{ConsumerConfig, MessageId, ProducerConfig, PulsarClient, Subscription, Topic}
import edu.cdl.iot.common.yaml.PulsarConfig
import edu.cdl.iot.ingestion.constants.PulsarConstants
import edu.cdl.iot.ingestion.dto.request.ImportRequest
import edu.cdl.iot.ingestion.dto.response.ImportResponse
import org.apache.camel.{Exchange, Processor}
import org.apache.pulsar.client.api.{Schema, SubscriptionType}

class ImportProcessors(private val config: PulsarConfig) {
  private val client = PulsarClient(config.host)
  private val importTopic = Topic(config.topics.`import`)
  private val consumerConfig = ConsumerConfig(
    Subscription(PulsarConstants.SUBSCRIPTION_NAME),
    Seq(importTopic),
    subscriptionType = Option.apply(SubscriptionType.Shared)
  )

  private val producerConfig = ProducerConfig(importTopic)

  private val importConsumer = client.consumer(consumerConfig)(Schema.BYTES)
  private val importProducer = client.producer(producerConfig)(Schema.BYTES)

  val publishImportRequest: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val request = exchange.getIn.getBody(classOf[ImportRequest])
      importProducer.send(request.envelope.toByteArray)
      exchange.getIn.setBody(new ImportResponse(true))
    }
  }

  val consumeImportRequests: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val response = importConsumer.receive
      if (response.isSuccess && response.get != null) {
        println("Consume Import")
        val message = response.get
        exchange.getIn.setBody(message.data)
        exchange.getIn.setHeader(PulsarConstants.MESSAGE_ID_HEADER, message.messageId)
      }
    }
  }

  val ackImportRequest: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      println("Ack Import")
      val messageId: MessageId = exchange.getIn().getHeader(PulsarConstants.MESSAGE_ID_HEADER, classOf[MessageId])
      importConsumer.acknowledge(messageId)
    }
  }


}