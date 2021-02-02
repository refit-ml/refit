package edu.cdl.iot.scheduler.integrations.camel.routes

import java.time.LocalDateTime
import java.util.UUID

import edu.cdl.iot.integrations.scheduler.core.entity.TrainingJob
import edu.cdl.iot.integrations.scheduler.core.service.TrainingJobService
import edu.cdl.iot.scheduler.integrations.camel.dto.TrainingJobRequest
import org.apache.camel.{CamelContext, Exchange}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.model.rest.{RestBindingMode, RestParamType}
import org.slf4j.LoggerFactory


class TrainingSchedulerRoute(trainingJobService: TrainingJobService,
                             context: CamelContext) extends RouteBuilder(context) {
  private val logger = LoggerFactory.getLogger(classOf[TrainingSchedulerRoute])

  override def configure(): Unit = {
    rest("/notebook/project/{projectGuid}/schedule/{jobName}")
      .post()
      .consumes("application/json")
      .`type`(classOf[TrainingJobRequest])
      .outType(classOf[String])
      .param.name("projectGuid").`type`(RestParamType.path).required(true).endParam()
      .param.name("jobName").`type`(RestParamType.path).required(true).endParam()
      .route()
      .process((exchange: Exchange) => {
        val message = exchange.getIn
        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
        val jobName = message.getHeader("jobName", classOf[String])
        val request = message.getBody(classOf[TrainingJobRequest])
        logger.info(s"Save training job: $jobName for project $projectGuid")
        val trainingJob = new TrainingJob(
          projectGuid = projectGuid,
          jobName = jobName,
          cronExpression = request.cronExpression,
          createdAt = LocalDateTime.now()
        )
        trainingJobService.saveTrainingJob(trainingJob)
        message.setBody("Job scheduled")
      })

//    rest("/notebook/project")
//      .consumes("application/json")
//      .delete(s"/{projectGuid}/scheduled/{jobName}")
//      .`type`(classOf[TrainingJobRequest])
//      .outType(classOf[String])
//      .route()
//      .process((exchange: Exchange) => {
//        val message = exchange.getIn
//        val projectGuid = UUID.fromString(message.getHeader("projectGuid", classOf[String]))
//        val jobName = message.getHeader("jobName", classOf[String])
//        val request = message.getBody(classOf[TrainingJobRequest])
//        logger.info(s"Save training job: $jobName for project $projectGuid")
//        val trainingJob = new TrainingJob(
//          projectGuid = projectGuid,
//          jobName = jobName,
//          cronExpression = request.cronExpression,
//          createdAt = LocalDateTime.now()
//        )
//        trainingJobService.saveTrainingJob(trainingJob)
//      })
  }
}
