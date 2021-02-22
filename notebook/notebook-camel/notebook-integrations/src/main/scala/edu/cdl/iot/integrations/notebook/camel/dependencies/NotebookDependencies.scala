package edu.cdl.iot.integrations.notebook.camel.dependencies

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.integrations.notebook.camel.routes.{NotebookImportRoutes, NotebookModelRoutes, NotebookProjectRoutes, NotebookQueryRoutes}
import edu.cdl.iot.integrations.notebook.cassandra.repository.{NotebookCassandraOrganizationRepository, NotebookCassandraProjectRepository, NotebookCassandraSensorDataRepository, NotebookCassandraSensorRepository, NotebookCassandraTrainingWindowRepository}
import edu.cdl.iot.integrations.notebook.core.service.{NotebookImportService, NotebookModelService, NotebookProjectService, NotebookQueryService}
import edu.cdl.iot.integrations.notebook.kafka.repository.{NotebookKafkaImportRepository, NotebookKafkaModelRepository}
import edu.cdl.iot.integrations.notebook.minio.repository.{NotebookMinioFileImportRepository, NotebookMinioSchemaRepository}
import org.apache.camel.CamelContext

class NotebookDependencies(config: RefitConfig,
                           cassandraRepository: CassandraRepository,
                           kafkaRepository: KafkaRepository,
                           minioRepository: MinioRepository,
                           camelContext: CamelContext,
                           decryptionHelperProvider: String => EncryptionHelper) {
  private val projectRepository = new NotebookCassandraProjectRepository(cassandraRepository)
  private val organizationRepository = new NotebookCassandraOrganizationRepository(cassandraRepository)
  private val sensorRepository = new NotebookCassandraSensorRepository(cassandraRepository)
  private val sensorDataRepository = new NotebookCassandraSensorDataRepository(
    cassandraRepository = cassandraRepository,
    decryptionHelper = decryptionHelperProvider
  )
  private val trainingWindowRepository = new NotebookCassandraTrainingWindowRepository(cassandraRepository)
  private val importRepository = new NotebookKafkaImportRepository(kafkaRepository)
  private val schemaRepository = new NotebookMinioSchemaRepository(minioRepository)
  private val modelRepository = new NotebookKafkaModelRepository(kafkaRepository)
  private val importFileRepository = new NotebookMinioFileImportRepository(minioRepository)


  private val importService = new NotebookImportService(
    minioConfig = config.getMinioConfig(),
    fileRepository = importFileRepository,
    projectRepository = projectRepository,
    sensorDataRepository = null,
    trainingWindowRepository = trainingWindowRepository,
    importRepository = importRepository
  )


  private val queryService = new NotebookQueryService(
    projectRepository = projectRepository,
    sensorRepository = sensorRepository,
    sensorDataRepository = sensorDataRepository,
    trainingWindowRepository = trainingWindowRepository
  )

  private val modelService = new NotebookModelService(
    projectRepository = projectRepository,
    modelRepository = modelRepository
  )

  private val projectService = new NotebookProjectService(
    projectRepository = projectRepository,
    schemaRepository = schemaRepository,
    organizationRepository = organizationRepository
  )

  val queryRoutes = new NotebookQueryRoutes(camelContext, queryService)
  val importRoutes = new NotebookImportRoutes(camelContext, importService)
  val projectRoutes = new NotebookProjectRoutes(camelContext, projectService)
  val modelRoutes = new NotebookModelRoutes(camelContext, modelService)

}
