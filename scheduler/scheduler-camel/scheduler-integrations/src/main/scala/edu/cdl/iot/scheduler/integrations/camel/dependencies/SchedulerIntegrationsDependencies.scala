package edu.cdl.iot.scheduler.integrations.camel.dependencies


import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.integrations.scheduler.core.service.TrainingJobService
import edu.cdl.iot.integrations.scheduler.jdbi.dependencies.SchedulerJdbiDependencies
import edu.cdl.iot.scheduler.integrations.camel.routes.TrainingSchedulerRoute
import edu.cdl.iot.scheduler.kafka.repository.KafkaTrainingJobNotificationRepository
import org.apache.camel.CamelContext
import org.jdbi.v3.core.Jdbi


class SchedulerIntegrationsDependencies(kafkaRepository: KafkaRepository,
                                        context: CamelContext,
                                        jdbi: Jdbi) {


  private val jdbiDependencies = new SchedulerJdbiDependencies(jdbi)
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
