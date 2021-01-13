package edu.cdl.iot.integrations.grafana.camel.dependencies

import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.integrations.grafana.camel.routes.GrafanaRoutes
import edu.cdl.iot.integrations.grafana.cassandra.repository.{GrafanaCassandraOrganizationRepository, GrafanaCassandraProjectRepository, GrafanaCassandraSensorDataRepository, GrafanaCassandraSensorRepository}
import edu.cdl.iot.integrations.grafana.core.service.{GrafanaAnnotationService, GrafanaQueryService, GrafanaSearchService, GrafanaTagService}
import org.apache.camel.CamelContext

class GrafanaDependencies(cassandraRepository: CassandraRepository,
                          camelContext: CamelContext,
                          decryptionHelperProvider: String => EncryptionHelper) {

  private val organizationRepository = new GrafanaCassandraOrganizationRepository(cassandraRepository)
  private val projectRepository = new GrafanaCassandraProjectRepository(cassandraRepository)
  private val sensorDataRepository = new GrafanaCassandraSensorDataRepository(
    cassandraRepository = cassandraRepository,
    decryptionHelper = decryptionHelperProvider
  )
  private val sensorRepository = new GrafanaCassandraSensorRepository(cassandraRepository)

  private val annotationService = new GrafanaAnnotationService()
  private val queryService = new GrafanaQueryService(
    projectRepository = projectRepository,
    sensorRepository = sensorRepository,
    sensorDataRepository = sensorDataRepository
  )

  private val searchService = new GrafanaSearchService(
    projectRepository = projectRepository,
    sensorRepository = sensorRepository
  )

  private val tagService = new GrafanaTagService(
    sensorRepository = sensorRepository,
    projectRepository = projectRepository,
    organizationRepository = organizationRepository
  )

  val grafanaRoutes = new GrafanaRoutes(
    context = camelContext,
    grafanaAnnotationService = annotationService,
    grafanaQueryService = queryService,
    grafanaTagService = tagService,
    grafanaSearchService = searchService
  )

}
