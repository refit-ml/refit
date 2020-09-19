package edu.cdl.iot.ingestion.transform

import com.sksamuel.pulsar4s.{ConsumerConfig, MessageId, ProducerConfig, PulsarClient, Subscription, Topic}
import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.ingestion.constants.PulsarConstants
import edu.cdl.iot.ingestion.dao.ImportDao
import edu.cdl.iot.ingestion.dto.request.ImportRequest
import edu.cdl.iot.ingestion.dto.response.ImportResponse
import edu.cdl.iot.ingestion.factories.SensorDataFactory
import edu.cdl.iot.ingestion.util.ImportHelper
import edu.cdl.iot.protocol.ImportRequest.{ImportRequest => ImportEnvelope}
import org.apache.camel.{Exchange, Processor}
import org.apache.pulsar.client.api.{Schema, SubscriptionType}
import io.minio.MinioClient

class ImportProcessors(private val config: RefitConfig,
                       private val importDao: ImportDao) {
  private val pulsarConfig = config.getPulsarConfig()
  private val minioConfig = config.getMinioConfig()
  private val client = PulsarClient(pulsarConfig.host)
  private val importTopic = Topic(pulsarConfig.topics.`import`)
  private val sensorDataTopic = Topic(pulsarConfig.topics.data)
  private val importConsumerConfig = ConsumerConfig(
    Subscription(PulsarConstants.SUBSCRIPTION_NAME),
    Seq(importTopic),
    subscriptionType = Option.apply(SubscriptionType.Shared)
  )

  private val sensorDataTopicConfig = ProducerConfig(sensorDataTopic)

  private val importProducerConfig = ProducerConfig(importTopic)

  private val importConsumer = client.consumer(importConsumerConfig)(Schema.BYTES)
  private val importProducer = client.producer(importProducerConfig)(Schema.BYTES)
  private val sensorDataProducer = client.producer(sensorDataTopicConfig)(Schema.BYTES)


  private val minioClient = MinioClient.builder
    .endpoint(minioConfig.host)
    .credentials(minioConfig.accessKey, minioConfig.secretKey)
    .build

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

  val deseralizeImportRequest: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn.getBody(classOf[Array[Byte]])
      val request = ImportEnvelope.parseFrom(body)
      exchange.getIn.setBody(request)
    }
  }

  val ackImportRequest: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      println("Ack Import")
      val messageId: MessageId = exchange.getIn().getHeader(PulsarConstants.MESSAGE_ID_HEADER, classOf[MessageId])
      importConsumer.acknowledge(messageId)
    }
  }

  val doImport: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val request = exchange.getIn.getBody(classOf[ImportEnvelope])
      val schema = importDao.getSchema(request.projectGuid)
      val encryptionHelper = new EncryptionHelper(config.getEncryptionKey(), request.projectGuid)
      val sensorDataFactory = new SensorDataFactory(schema, encryptionHelper)
      val iterator = ImportHelper.getMinioLineIterator(minioClient, minioConfig.buckets.`import`, request.filePath)

      iterator
        .drop(1)
        .map(x => sensorDataFactory.fromCsv(x))
        .foreach(x => {
          println("Try Send")
          sensorDataProducer.send(x.toByteArray)
          println("Sent!")
        })

    }
  }

}