package edu.cdl.iot.integrations.application.dependencies

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.integrations.application.Constants
import edu.cdl.iot.integrations.grafana.camel.dependencies.GrafanaDependencies
import edu.cdl.iot.integrations.grafana.camel.routes.GrafanaRoutes
import edu.cdl.iot.integrations.notebook.camel.dependencies.NotebookDependencies
import edu.cdl.iot.integrations.notebook.camel.routes.{NotebookImportRoutes, NotebookModelRoutes, NotebookProjectRoutes, NotebookQueryRoutes}
import edu.cdl.iot.prediction.camel.dependencies.PredictionDependencies
import edu.cdl.iot.prediction.camel.routes.PredictionRoutes
import edu.cdl.iot.scheduler.integrations.camel.dependencies.SchedulerIntegrationsDependencies
import javax.crypto.Cipher
import org.apache.camel.CamelContext

import scala.collection.mutable

class IntegrationsDependencies(config: RefitConfig,
                               camelContext: CamelContext) {

  private val decryptionHelperMap = mutable.Map[String, EncryptionHelper]()
  private val encryptionHelperMap = mutable.Map[String, EncryptionHelper]()

  private val decryptionHelperProvider = projectGuid => {
    decryptionHelperMap.getOrElseUpdate(projectGuid, {
      new EncryptionHelper(
        key = config.getEncryptionKey(),
        salt = projectGuid,
        mode = Cipher.DECRYPT_MODE
      )
    })
  }

  private val encryptionHelperProvider = projectGuid => {
    encryptionHelperMap.getOrElseUpdate(projectGuid, {
      new EncryptionHelper(
        key = config.getEncryptionKey(),
        salt = projectGuid,
        mode = Cipher.ENCRYPT_MODE
      )
    })
  }

  private val cassandraRepository = new CassandraRepository(config.getCassandraConfig())
  private val kafkaRepository = new KafkaRepository(config.getKafkaConfig(), Constants.GROUP_IDENTIFIER)
  private val minioRepository = new MinioRepository(config.getMinioConfig())

  private val grafanaDependencies = new GrafanaDependencies(
    cassandraRepository = cassandraRepository,
    camelContext = camelContext,
    decryptionHelperProvider = decryptionHelperProvider
  )

  private val notebookDependencies = new NotebookDependencies(
    config = config,
    cassandraRepository = cassandraRepository,
    kafkaRepository = kafkaRepository,
    minioRepository = minioRepository,
    camelContext = camelContext,
    decryptionHelperProvider = decryptionHelperProvider
  )

  private val predictionDependencies = new PredictionDependencies(
    kafkaConfig = config.getKafkaConfig(),
    cassandraRepository = cassandraRepository,
    camelContext = camelContext,
    encryptionHelperProvider = encryptionHelperProvider
  )

  val schedulerDependencies = new SchedulerIntegrationsDependencies(
    config = config,
    kafkaRepository = kafkaRepository,
    context = camelContext
  )

  val grafanaRoutes: GrafanaRoutes = grafanaDependencies.grafanaRoutes
  val notebookQueryRoutes: NotebookQueryRoutes = notebookDependencies.queryRoutes
  val notebookModelRoutes: NotebookModelRoutes = notebookDependencies.modelRoutes
  val notebookProjectRoutes: NotebookProjectRoutes = notebookDependencies.projectRoutes
  val notebookImportRoutes: NotebookImportRoutes = notebookDependencies.importRoutes
  val predictionRoutes: PredictionRoutes = predictionDependencies.predictionRoutes
}
