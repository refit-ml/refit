package edu.cdl.iot.ingestion.transform

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.ingestion.constants.ImportConstants
import edu.cdl.iot.ingestion.dao.ImportDao
import edu.cdl.iot.ingestion.dto.request.ImportRequest
import edu.cdl.iot.ingestion.dto.response.ImportResponse
import edu.cdl.iot.ingestion.factories.{SensorDataFactory, TrainingWindowFactory}
import edu.cdl.iot.ingestion.util.ImportHelper
import edu.cdl.iot.protocol.ImportRequest.{ImportRequest => ImportEnvelope}
import org.apache.camel.{Exchange, Processor}
import io.minio.{MinioClient, RemoveObjectArgs}
import org.apache.kafka.clients.producer.{KafkaProducer, ProducerRecord}

class ImportProcessors(private val config: RefitConfig,
                       private val importDao: ImportDao,
                       private val kafkaProducer: KafkaProducer[Array[Byte], Array[Byte]]) {
  private val kafkaConfig = config.getKafkaConfig()
  private val minioConfig = config.getMinioConfig()

  private val minioClient = MinioClient.builder
    .endpoint(minioConfig.host)
    .credentials(minioConfig.accessKey, minioConfig.secretKey)
    .build

  val publishImportRequest: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val request = exchange.getIn.getBody(classOf[ImportRequest])

      kafkaProducer.send(new ProducerRecord[Array[Byte], Array[Byte]](
        kafkaConfig.topics.`import`,
        request.envelope.toByteArray
      ))
      exchange.getIn.setBody(new ImportResponse(true))
    }
  }

  val deseralizeImportRequest: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn.getBody(classOf[Array[Byte]])
      val request = ImportEnvelope.parseFrom(body)
      exchange.getIn.setBody(request)
    }
  }

  val doImport: Processor = new Processor {

    def processSensorDataDataImport(iterator: Iterator[String], schema: edu.cdl.iot.common.schema.Schema): Unit = {
      val sensorDataFactory = new SensorDataFactory(schema)
      iterator
        .drop(1)
        .map(x => sensorDataFactory.fromCsv(x))
        .foreach(x => {
          kafkaProducer.send(
            new ProducerRecord[Array[Byte], Array[Byte]](
              kafkaConfig.topics.data,
              x.toByteArray
            )
          )
        })
    }

    def processTrainingWindowImport(iterator: Iterator[String], schema: edu.cdl.iot.common.schema.Schema): Unit = {
      val trainingWindowFactory = new TrainingWindowFactory(schema)
      iterator
        .drop(1)
        .map(x => trainingWindowFactory.fromCsv(x))
        .grouped(ImportConstants.BATCH_SIZE)
        .foreach(x => {
          importDao.createTrainingWindow(x)
        })
    }

    override def process(exchange: Exchange): Unit = {
      val request = exchange.getIn.getBody(classOf[ImportEnvelope])
      val schema = importDao.getSchema(request.projectGuid)

      try {
        println("Get file stream")
        val iterator = ImportHelper.getMinioLineIterator(minioClient, minioConfig.buckets.`import`, request.filePath)
        println("Process Stream")
        if (request.importTrainingWindow)
          processTrainingWindowImport(iterator, schema)
        else
          processSensorDataDataImport(iterator, schema)
        println("Done processing stream")
      }
      catch {
        case ex: Throwable => {
          println(ex.toString)
        }
      }
      finally {
        if (request.deleteWhenComplete) {
          println("Request finished: Removing file")
          val removeRequest = RemoveObjectArgs.builder()
            .bucket(minioConfig.buckets.`import`)
            .`object`(request.filePath)
            .build()
          minioClient.removeObject(removeRequest)
        }
      }
    }
  }

}