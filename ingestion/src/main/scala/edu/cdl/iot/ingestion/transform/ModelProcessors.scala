package edu.cdl.iot.ingestion.transform

import com.google.protobuf.ByteString
import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.ingestion.dto.request.ModelRequest
import edu.cdl.iot.ingestion.dto.response.ImportResponse
import edu.cdl.iot.ingestion.util.MinioHelper
import edu.cdl.iot.protocol.Model.Model
import io.minio.{GetObjectArgs, MinioClient}
import org.apache.camel.{Exchange, Processor}
import org.apache.kafka.clients.producer.{KafkaProducer, ProducerRecord}


class ModelProcessors(private val config: RefitConfig,
                      private val kafkaProducer: KafkaProducer[Array[Byte], Array[Byte]]) {
  private val kafkaConfig = config.getKafkaConfig()
  private val minioConfig = config.getMinioConfig()


  private val minioClient = MinioClient.builder
    .endpoint(minioConfig.host)
    .credentials(minioConfig.accessKey, minioConfig.secretKey)
    .build


  val modelProcessor: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val request = exchange.getIn.getBody(classOf[ModelRequest])
      val getObjectRequest = GetObjectArgs.builder()
        .bucket(minioConfig.buckets.models)
        .`object`(request.path)
        .build()

      val modelBytes = MinioHelper.inputStreamToBytes(minioClient.getObject(getObjectRequest))

      val model = Model(request.projectGuid,
        request.modelGuid,
        ByteString.copyFrom(modelBytes))

      kafkaProducer.send(
        new ProducerRecord[Array[Byte], Array[Byte]](
          kafkaConfig.topics.models,
          model.toByteArray
        )
      )
      exchange.getIn.setBody(new ImportResponse(true))
    }
  }

}
