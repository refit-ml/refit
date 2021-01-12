package edu.cdl.iot.integrations.application.dependencies

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.integrations.application.routes.{NotebookRoutes, PredictionRoutes}
import edu.cdl.iot.integrations.cassandra.repository.{IntegrationsCassandraPredictionRepository, IntegrationsCassandraProjectRepository, IntegrationsCassandraSensorDataRepository, IntegrationsCassandraSensorRepository, IntegrationsCassandraTrainingWindowRepository}
import edu.cdl.iot.integrations.core.service.{NotebookQueryService, PredictionService}
import edu.cdl.iot.integrations.grafana.camel.dependencies.GrafanaDependencies
import edu.cdl.iot.integrations.grafana.camel.routes.GrafanaRoutes
import javax.crypto.Cipher
import org.apache.camel.CamelContext

import scala.collection.mutable

class IntegrationsDependencies(config: RefitConfig,
                               camelContext: CamelContext) {

  private val decryptionHelperMap = mutable.Map[String, EncryptionHelper]()

  private val cassandraRepository = new CassandraRepository(config.getCassandraConfig())

  private val grafanaDependencies = new GrafanaDependencies(
    cassandraRepository = cassandraRepository,
    camelContext=camelContext
  )

  private val predictionRepository = new IntegrationsCassandraPredictionRepository(cassandraRepository)
  private val projectRepository = new IntegrationsCassandraProjectRepository(cassandraRepository)
  private val sensorRepository = new IntegrationsCassandraSensorRepository(cassandraRepository)
  private val trainingWindowRepository = new IntegrationsCassandraTrainingWindowRepository(cassandraRepository)
  private val sensorDataRepository = new IntegrationsCassandraSensorDataRepository(
    cassandraRepository,
    projectGuid => {
      decryptionHelperMap.getOrElseUpdate(projectGuid, {
        new EncryptionHelper(
          key = config.getEncryptionKey(),
          salt = projectGuid,
          mode = Cipher.DECRYPT_MODE
        )
      })
    })

  private val predictionService = new PredictionService(config, projectRepository, sensorRepository, predictionRepository)
  private val notebookQueryService = new NotebookQueryService(projectRepository, sensorRepository, sensorDataRepository, trainingWindowRepository)

  val notebookRoutes = new NotebookRoutes(
    camelContext,
    notebookQueryService
  )



  val grafanaRoutes: GrafanaRoutes = grafanaDependencies.grafanaRoutes

  val predictionRoutes = new PredictionRoutes(camelContext, config.getKafkaConfig(), predictionService)

}
