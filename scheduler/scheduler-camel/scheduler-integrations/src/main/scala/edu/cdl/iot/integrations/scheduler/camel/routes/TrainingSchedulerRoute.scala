package edu.cdl.iot.integrations.scheduler.camel.routes

import java.time.LocalDateTime
import java.util.UUID

import edu.cdl.iot.integrations.scheduler.core.entity.TrainingJob
import edu.cdl.iot.integrations.scheduler.core.service.TrainingJobService
import org.apache.camel.{CamelContext, Exchange}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.RestParamType
import org.slf4j.LoggerFactory


class TrainingSchedulerRoute(trainingJobService: TrainingJobService,
                             context: CamelContext) extends RouteBuilder(context) {
  private val logger = LoggerFactory.getLogger(classOf[TrainingSchedulerRoute])

  override def configure(): Unit = {
    rest("/notebook/project")
      .get(s"/{projectGuid}/schedule/{jobName}")
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .param.name("jobName").`type`(RestParamType.path).required(true).endParam()
      .param.name("cronExpression").`type`(RestParamType.body).required(true).endParam()
      .outType(classOf[String])
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        val jobName = message.getHeader("jobName", classOf[String])
        val cronExpression = message.getHeader("cronExpression", classOf[String])
        logger.info(s"Save training job: $jobName for project $projectGuid")
        val trainingJob = new TrainingJob(
          projectGuid = projectGuid,
          jobName = jobName,
          cronExpression = cronExpression,
          createdAt = LocalDateTime.now()
        )
        trainingJobService.saveTrainingJob(trainingJob)
      })

    rest("/notebook/project")
      .delete(s"/{projectGuid}/schedule/{jobName}")
      .outType(classOf[String])
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        val jobName = message.getHeader("jobName", classOf[String])
        val cronExpression = message.getHeader("cronExpression", classOf[String])
        logger.info(s"Save training job: $jobName for project $projectGuid")
        val trainingJob = new TrainingJob(
          projectGuid = projectGuid,
          jobName = jobName,
          cronExpression = cronExpression,
          createdAt = LocalDateTime.now()
        )
        trainingJobService.saveTrainingJob(trainingJob)
      })
  }
}
