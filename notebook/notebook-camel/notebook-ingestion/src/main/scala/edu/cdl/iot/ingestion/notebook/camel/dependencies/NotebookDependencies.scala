package edu.cdl.iot.ingestion.notebook.camel.dependencies

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.data.postgres.repository.JdbiStaticDataRepository
import edu.cdl.iot.ingestion.notebook.camel.routes.NotebookImportRoutes
import edu.cdl.iot.integrations.notebook.cassandra.repository.{NotebookCassandraProjectRepository, NotebookCassandraTrainingWindowRepository}
import edu.cdl.iot.integrations.notebook.core.service.NotebookImportService
import edu.cdl.iot.integrations.notebook.kafka.repository.NotebookKafkaSensorDataRepository
import edu.cdl.iot.integrations.notebook.minio.repository.NotebookMinioFileImportRepository
import edu.cdl.iot.notebook.jdbi.repository.NotebookJdbiStaticDataRepository
import org.apache.camel.CamelContext
import org.jdbi.v3.core.Jdbi

class NotebookDependencies(config: RefitConfig,
                           context: CamelContext,
                           jdbi: Jdbi,
                           cassandraRepository: CassandraRepository,
                           kafkaRepository: KafkaRepository,
                           minioRepository: MinioRepository) {

  private val projectRepository = new NotebookCassandraProjectRepository(cassandraRepository)
  private val sensorDataRepository = new NotebookKafkaSensorDataRepository(kafkaRepository)
  private val trainingWindowRepository = new NotebookCassandraTrainingWindowRepository(cassandraRepository)

  private val importFileRepository = new NotebookMinioFileImportRepository(minioRepository)
  private val staticDataRepository = new NotebookJdbiStaticDataRepository(jdbi)

  private val importService = new NotebookImportService(
    minioConfig = config.getMinioConfig(),
    fileRepository = importFileRepository,
    projectRepository = projectRepository,
    sensorDataRepository = sensorDataRepository,
    trainingWindowRepository = trainingWindowRepository,
    staticDataRepository = staticDataRepository,
    importRepository = null,
    trainingWindowImportRepository = null,
    staticDataImportRepository = null
  )

  val importRoutes = new NotebookImportRoutes(
    kafkaConfig = config.getKafkaConfig(),
    importService = importService,
    context
  )
}
