package edu.cdl.iot.ingestion.transform

import com.google.protobuf.ByteString
//import org.apache.pulsar.client.api.Schema
//import com.sksamuel.pulsar4s.{ProducerConfig, PulsarClient, Topic}
import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.ingestion.dto.request.ModelRequest
import edu.cdl.iot.ingestion.dto.response.ImportResponse
import edu.cdl.iot.ingestion.util.MinioHelper
import edu.cdl.iot.protocol.Model.Model
import io.minio.{GetObjectArgs, MinioClient}
import org.apache.camel.{Exchange, Processor}


class ModelProcessors(config: RefitConfig) {
//  private val pulsarConfig = config.getPulsarConfig()
//  private val minioConfig = config.getMinioConfig()
//
//  private val pulsarClient = PulsarClient(pulsarConfig.host)
//
//  private val minioClient = MinioClient.builder
//    .endpoint(minioConfig.host)
//    .credentials(minioConfig.accessKey, minioConfig.secretKey)
//    .build
//
//  private val modelTopic = Topic(pulsarConfig.topics.models)
//  private val modelProducerConfig = ProducerConfig(modelTopic)
//
//  private val modelProducer = pulsarClient.producer(modelProducerConfig)(Schema.BYTES)
//
//
//  val modelProcessor: Processor = new Processor {
//    override def process(exchange: Exchange): Unit = {
//      val request = exchange.getIn.getBody(classOf[ModelRequest])
//      val getObjectRequest = GetObjectArgs.builder()
//        .bucket(minioConfig.buckets.models)
//        .`object`(request.path)
//        .build()
//
//      val modelBytes = MinioHelper.inputStreamToBytes(minioClient.getObject(getObjectRequest))
//
//      val model = Model(request.projectGuid,
//        request.modelGuid,
//        ByteString.copyFrom(modelBytes))
//
//      println("Try Send")
//      modelProducer.send(model.toByteArray)
//      exchange.getIn.setBody(new ImportResponse(true))
//      println("Sent")
//    }
//  }

}
