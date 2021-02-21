package edu.cdl.iot.ingestion.notebook.camel.dependencies

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.ingestion.notebook.camel.routes.NotebookImportRoutes
import edu.cdl.iot.integrations.notebook.cassandra.repository.{NotebookCassandraProjectRepository, NotebookCassandraSensorDataRepository, NotebookCassandraTrainingWindowRepository}
import edu.cdl.iot.integrations.notebook.core.service.NotebookImportService
import edu.cdl.iot.integrations.notebook.kafka.repository.NotebookKafkaSensorDataRepository
import edu.cdl.iot.integrations.notebook.minio.repository.NotebookMinioFileImportRepository
import org.apache.camel.CamelContext

class NotebookDependencies(config: RefitConfig,
                           context: CamelContext,
                           cassandraRepository: CassandraRepository,
                           kafkaRepository: KafkaRepository,
                           minioRepository: MinioRepository) {

  private val projectRepository = new NotebookCassandraProjectRepository(cassandraRepository)
  private val sensorDataRepository = new NotebookKafkaSensorDataRepository(kafkaRepository)
  private val trainingWindowRepository = new NotebookCassandraTrainingWindowRepository(cassandraRepository)

  private val importFileRepository = new NotebookMinioFileImportRepository(minioRepository)


  private val importService = new NotebookImportService(
    minioConfig = config.getMinioConfig(),
    fileRepository = importFileRepository,
    projectRepository = projectRepository,
    sensorDataRepository = sensorDataRepository,
    trainingWindowRepository = trainingWindowRepository
  )

  val importRoutes = new NotebookImportRoutes(
    kafkaConfig = config.getKafkaConfig(),
    importService = importService,
    context
  )
}
