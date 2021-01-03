package edu.cdl.iot.integrations.application.dependencies

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.integrations.application.routes.{GrafanaRoutes, PredictionRoutes}
import edu.cdl.iot.integrations.cassandra.repository.{IntegrationsCassandraOrganizationRepository, IntegrationsCassandraPredictionRepository, IntegrationsCassandraProjectRepository, IntegrationsCassandraSensorDataRepository, IntegrationsCassandraSensorRepository}
import edu.cdl.iot.integrations.core.service.{GrafanaAnnotationService, GrafanaQueryService, GrafanaSearchService, GrafanaTagService, PredictionService}
import org.apache.camel.CamelContext

class IntegrationsDependencies(config: RefitConfig,
                              camelContext: CamelContext) {
  private val cassandraRepository = new CassandraRepository(config.getCassandraConfig())

  private val organizationRepository = new IntegrationsCassandraOrganizationRepository(cassandraRepository)
  private val predictionRepository = new IntegrationsCassandraPredictionRepository(cassandraRepository)
  private val projectRepository = new IntegrationsCassandraProjectRepository(cassandraRepository)
  private val sensorRepository = new IntegrationsCassandraSensorRepository(cassandraRepository)
  private val sensorDataRepository = new IntegrationsCassandraSensorDataRepository(cassandraRepository)

  private val grafanaAnnotationService = new GrafanaAnnotationService()
  private val grafanaQueryService = new GrafanaQueryService(projectRepository, sensorRepository, sensorDataRepository)
  private val grafanaSearchService = new GrafanaSearchService(projectRepository, sensorRepository)
  private val grafanaTagService = new GrafanaTagService(sensorRepository, projectRepository, organizationRepository)
  private val predictionService = new PredictionService(config, projectRepository, sensorRepository, predictionRepository)

  val grafanaRoutes = new GrafanaRoutes(
    camelContext,
    grafanaAnnotationService,
    grafanaQueryService,
    grafanaTagService,
    grafanaSearchService
  )

  val predictionRoutes = new PredictionRoutes(camelContext, config.getKafkaConfig(), predictionService)

}
