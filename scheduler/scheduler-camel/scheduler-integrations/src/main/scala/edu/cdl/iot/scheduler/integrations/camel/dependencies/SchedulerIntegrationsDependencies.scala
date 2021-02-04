package edu.cdl.iot.scheduler.integrations.camel.dependencies

import java.util.Properties

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.yaml.PostgresConfig
import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.integrations.scheduler.core.service.TrainingJobService
import edu.cdl.iot.integrations.scheduler.jdbi.dependencies.SchedulerJdbiDependencies
import edu.cdl.iot.integrations.scheduler.kube.repository.KubeTrainingJobDeploymentRepository
import edu.cdl.iot.scheduler.integrations.camel.routes.TrainingSchedulerRoute
import edu.cdl.iot.scheduler.kafka.repository.KafkaTrainingJobNotificationRepository
import org.apache.camel.CamelContext


class SchedulerIntegrationsDependencies(config: RefitConfig,
                                        kafkaRepository: KafkaRepository,
                                        context: CamelContext) {


  private val postgresConfig = config.getPostgresConfig()

  private val jdbiDependencies = new SchedulerJdbiDependencies(postgresConfig)
  private val trainingJobDeploymentRepository = null
  private val trainingJobNotificationRepository = new KafkaTrainingJobNotificationRepository(kafkaRepository)
  private val trainingJobService = new TrainingJobService(
    trainingJobRepository = jdbiDependencies.trainingJobRepository,
    trainingJobDeploymentRepository = trainingJobDeploymentRepository,
    trainingJobNotificationRepository = trainingJobNotificationRepository
  )

  val timedRoutesBuilder = new TrainingSchedulerRoute(
    trainingJobService = trainingJobService,
    context = context
  )

}
