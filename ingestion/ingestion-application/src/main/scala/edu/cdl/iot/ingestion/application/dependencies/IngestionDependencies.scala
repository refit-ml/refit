package edu.cdl.iot.ingestion.application.dependencies

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.ingestion.cassandra.repository.{IngestionProjectRepository, IngestionTrainingWindowRepository}
import edu.cdl.iot.ingestion.core.service.ImportService
import edu.cdl.iot.ingestion.kafka.IngestionSensorDataRepository
import edu.cdl.iot.ingestion.minio.IngestionImportFileRepository
import edu.cdl.iot.ingestion.application.routes.ImportRoutes
import org.apache.camel.CamelContext

class IngestionDependencies(config: RefitConfig,
                            context: CamelContext) {

  private val cassandraRepository = new CassandraRepository(config.getCassandraConfig())
  private val kafkaRepository = new KafkaRepository(config.getKafkaConfig(), "ingestion")
  private val minioRepository = new MinioRepository(config.getMinioConfig())

  private val projectRepository = new IngestionProjectRepository(cassandraRepository)
  private val sensorDataRepository = new IngestionSensorDataRepository(kafkaRepository)
  private val trainingWindowRepository = new IngestionTrainingWindowRepository(cassandraRepository)

  private val importFileRepository = new IngestionImportFileRepository(minioRepository)


  private val importService = new ImportService(
    minioConfig = config.getMinioConfig(),
    fileRepository = importFileRepository,
    projectRepository = projectRepository,
    sensorDataRepository = sensorDataRepository,
    trainingWindowRepository = trainingWindowRepository
  )

  val importRoutes = new ImportRoutes(
    kafkaConfig = config.getKafkaConfig(),
    importService = importService,
    context
  )
}
