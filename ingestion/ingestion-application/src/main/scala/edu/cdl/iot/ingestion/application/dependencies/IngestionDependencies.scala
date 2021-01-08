package edu.cdl.iot.ingestion.application.dependencies

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.ingestion.cassandra.repository.{IngestionOrganizationRepository, IngestionProjectRepository, IngestionSensorRepository, IngestionTrainingWindowRepository}
import edu.cdl.iot.ingestion.core.service.{ImportService, ModelService, ProjectService}
import edu.cdl.iot.ingestion.kafka.{IngestionImportRepository, IngestionSensorDataRepository}
import edu.cdl.iot.ingestion.minio.{IngestionImportFileRepository, IngestionModelFileRepository, IngestionSchemaRepository}
import edu.cdl.iot.ingestion.kafka.IngestionModelRepository
import edu.cdl.iot.ingestion.application.routes.ImportRoutes
import org.apache.camel.CamelContext

class IngestionDependencies(config: RefitConfig,
                            context: CamelContext) {

  private val cassandraRepository = new CassandraRepository(config.getCassandraConfig())
  private val kafkaRepository = new KafkaRepository(config.getKafkaConfig(), "ingestion")
  private val minioRepository = new MinioRepository(config.getMinioConfig())

  private val organizationRepository = new IngestionOrganizationRepository(cassandraRepository)
  private val projectRepository = new IngestionProjectRepository(cassandraRepository)
  private val sensorDataRepository = new IngestionSensorDataRepository(kafkaRepository)
  private val trainingWindowRepository = new IngestionTrainingWindowRepository(cassandraRepository)
  private val importRepository = new IngestionImportRepository(kafkaRepository)

  private val schemaRepository = new IngestionSchemaRepository(minioRepository)
  private val modelRepository = new IngestionModelRepository(kafkaRepository)
  private val modelFileRepository = new IngestionModelFileRepository(minioRepository)
  private val importFileRepository = new IngestionImportFileRepository(minioRepository)


  private val importService = new ImportService(
    minioConfig = config.getMinioConfig(),
    fileRepository = importFileRepository,
    projectRepository = projectRepository,
    sensorDataRepository = sensorDataRepository,
    trainingWindowRepository = trainingWindowRepository,
    importRepository = importRepository
  )

  private val modelService = new ModelService(
    modelRepository = modelRepository,
    modelFileRepository = modelFileRepository
  )

  private val projectService = new ProjectService(
    organizationRepository = organizationRepository,
    projectRepository = projectRepository,
    schemaRepository = schemaRepository
  )

  val importRoutes = new ImportRoutes(
    kafkaConfig = config.getKafkaConfig(),
    importService = importService,
    modelService = modelService,
    projectService = projectService,
    context
  )
}
