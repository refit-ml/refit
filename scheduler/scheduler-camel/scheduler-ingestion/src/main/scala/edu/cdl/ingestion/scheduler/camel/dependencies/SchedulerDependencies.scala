package edu.cdl.ingestion.scheduler.camel.dependencies


import java.util.Properties

import edu.cdl.ingestion.scheduler.camel.routes.TrainingSchedulerRoute
import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.yaml.PostgresConfig
import edu.cdl.iot.integrations.scheduler.core.service.TrainingJobService
import edu.cdl.iot.integrations.scheduler.jdbi.dependencies.SchedulerJdbiDependencies
import edu.cdl.iot.integrations.scheduler.kube.config.SchedulerKubeConfig
import edu.cdl.iot.integrations.scheduler.kube.repository.KubeTrainingJobDeploymentRepository
import org.apache.camel.CamelContext
import org.jdbi.v3.core.Jdbi


class SchedulerDependencies(config: RefitConfig,
                            context: CamelContext,
                            jdbi: Jdbi) {

  private def defaultCamelProperties(config: PostgresConfig): Properties = {
    val properties = new Properties()
    properties.setProperty("org.quartz.scheduler.instanceName", "PostgresScheduler")
    properties.setProperty("org.quartz.scheduler.instanceId", "AUTO")
    properties.setProperty("org.quartz.jobStore.class", "org.quartz.impl.jdbcjobstore.JobStoreTX")
    properties.setProperty("org.quartz.jobStore.driverDelegateClass", "org.quartz.impl.jdbcjobstore.PostgreSQLDelegate")
    properties.setProperty("org.quartz.jobStore.dataSource", "quartzDS")
    properties.setProperty("org.quartz.dataSource.quartzDS.driver", "org.postgresql.Driver")
    properties.setProperty("org.quartz.dataSource.quartzDS.URL", s"jdbc:postgresql://${config.host}:${config.port}/${config.schema}")
    properties.setProperty("org.quartz.dataSource.quartzDS.user", config.username)
    properties.setProperty("org.quartz.dataSource.quartzDS.password", config.password)
    properties.setProperty("org.quartz.jobStore.isClustered", "true")
    properties.setProperty("org.quartz.threadPool.class", "org.quartz.simpl.SimpleThreadPool")
    properties.setProperty("org.quartz.threadPool.threadCount", "25")
    properties.setProperty("org.quartz.threadPool.threadPriority", "5")
    properties.setProperty("org.quartz.jobStore.useProperties", "false")
    properties
  }

  private val kakfaConfig = config.getKafkaConfig()
  private val schedulerKubeConfig = SchedulerKubeConfig()
  private val postgresConfig = config.getPostgresConfig()

  private val jdbiDependencies = new SchedulerJdbiDependencies(jdbi)
  private val trainingJobDeploymentRepository = new KubeTrainingJobDeploymentRepository(config, schedulerKubeConfig)
  private val trainingJobNotificationRepository = null


  private val trainingJobService = new TrainingJobService(
    trainingJobRepository = jdbiDependencies.trainingJobRepository,
    trainingJobDeploymentRepository = trainingJobDeploymentRepository,
    trainingJobNotificationRepository = trainingJobNotificationRepository
  )

  val properties: Properties = defaultCamelProperties(postgresConfig)

  val routes = new TrainingSchedulerRoute(
    kakfaConfig,
    trainingJobService,
    context
  )

}
