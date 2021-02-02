package edu.cdl.ingestion.scheduler.camel.routes

import java.util.UUID

import edu.cdl.iot.common.yaml.KafkaConfig
import edu.cdl.iot.integrations.scheduler.core.entity.TrainingJob
import edu.cdl.iot.integrations.scheduler.core.service.TrainingJobService
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.{CamelContext, Exchange}
import org.quartz.JobDetail
import org.slf4j.LoggerFactory
import edu.cdl.iot.protocol.TrainingJob.{TrainingJob => TrainingJobMessage}

class TrainingSchedulerRoute(val kafkaConfig: KafkaConfig,
                             val trainingJobService: TrainingJobService,
                             val context: CamelContext) extends RouteBuilder(context) {
  private val logger = LoggerFactory.getLogger(classOf[TrainingSchedulerRoute])

  override def configure(): Unit = {
    trainingJobService.forEachTrainingJob(configureTrainingJob)

    from(s"kafka:${kafkaConfig.topics.`import`}?brokers=${kafkaConfig.host}")
      .process((exchange: Exchange) => {
        val body = exchange.getIn.getBody(classOf[Array[Byte]])
        val message = TrainingJobMessage.parseFrom(body)
        val trainingJob = new TrainingJob(
          projectGuid = UUID.fromString(message.projectGuid),
          jobName = message.jobName,
          cronExpression = message.cronExpression,
          createdAt = null
        )
        logger.info(s"New job (${message.jobName}) scheduled for project: ${message.projectGuid}")
        configureTrainingJob(trainingJob)

      })
  }

  private def configureTrainingJob(trainingJob: TrainingJob): Unit = {
    val cronExpression = trainingJob.cronExpression.replace(" ", "+")
    val uri = s"quartz://${trainingJob.projectGuid}/${trainingJob.jobName}?cron=$cronExpression"
    val routeId = s"${trainingJob.projectGuid}:${trainingJob.jobName}"
    val route = context.getRoute(routeId)

    if (route != null) {
      context.removeRoute(routeId)
    }
    from(uri)
      .routeId(routeId)
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val jobDetail = message.getHeader("jobDetail", classOf[JobDetail])
        val projectGuid = UUID.fromString(jobDetail.getKey.getGroup)
        val jobName = jobDetail.getKey.getName
        logger.info(s"Scheduling Job: $jobName for project $projectGuid")
        trainingJobService
          .scheduleTrainingJob(projectGuid, jobName)
          .fold(
            trainingJobDeployment => logger.info(s"Successfully scheduled job: $jobName for project $projectGuid", trainingJobDeployment),
            trainingJobError => logger.error(s"Failed to schedule job: $jobName for project $projectGuid", trainingJobError)
          )
      })


  }
}
