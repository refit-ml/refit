package edu.cdl.iot.integrations.notebook.camel.dependencies

import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.integrations.notebook.camel.routes.NotebookRoutes
import edu.cdl.iot.integrations.notebook.cassandra.repository.{NotebookCassandraOrganizationRepository, NotebookCassandraProjectRepository, NotebookCassandraSensorDataRepository, NotebookCassandraSensorRepository, NotebookCassandraTrainingWindowRepository}
import edu.cdl.iot.integrations.notebook.core.repository.NotebookModelFileRepository
import edu.cdl.iot.integrations.notebook.core.service.NotebookIntegrationService
import edu.cdl.iot.integrations.notebook.kafka.repository.{NotebookKafkaImportRepository, NotebookKafkaModelRepository}
import edu.cdl.iot.integrations.notebook.minio.repository.{NotebookMinioModelRepository, NotebookMinioSchemaRepository}
import org.apache.camel.CamelContext

class NotebookDependencies(cassandraRepository: CassandraRepository,
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
  private val modelFileRepository = new NotebookMinioModelRepository(minioRepository)

  private val notebookIntegrationService = new NotebookIntegrationService(
    projectRepository = projectRepository,
    sensorRepository = sensorRepository,
    sensorDataRepository = sensorDataRepository,
    trainingWindowRepository = trainingWindowRepository,
    organizationRepository = organizationRepository,
    importRepository = importRepository,
    schemaRepository = schemaRepository,
    modelRepository = modelRepository,
    modelFileRepository = modelFileRepository
  )

  val notebookRoutes = new NotebookRoutes(camelContext, notebookIntegrationService)

}
