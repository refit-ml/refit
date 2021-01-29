package edu.cdl.iot.integrations.scheduler.camel.routes

import java.util.UUID

import edu.cdl.iot.integrations.scheduler.core.entity.TrainingJob
import edu.cdl.iot.integrations.scheduler.core.service.TrainingJobService
import org.apache.camel.{CamelContext, Exchange}
import org.apache.camel.builder.RouteBuilder
import org.quartz.{JobDataMap, JobDetail}
import org.quartz.impl.JobDetailImpl
import org.slf4j.LoggerFactory

import scala.collection.JavaConverters.mapAsJavaMapConverter

class TrainingSchedulerRoute(trainingJobService: TrainingJobService,
                             context: CamelContext) extends RouteBuilder(context) {
  val logger = LoggerFactory.getLogger(classOf[TrainingSchedulerRoute])

  override def configure(): Unit = {
    context.getRegistry.bind("p1", Map("one" -> "two").asJava)
    trainingJobService.forEachTrainingJob(configureTrainingJob)
  }

  private def configureTrainingJob(trainingJob: TrainingJob): Unit = {
    val cronExpression = trainingJob.cronExpression.replace(" ", "+")
    val uri = s"quartz://${trainingJob.projectGuid}/${trainingJob.jobName}?cron=$cronExpression"
    val routeId = s"${trainingJob.projectGuid}:${trainingJob.jobName}"
    val route = context.getRoute(routeId)
    if(route != null) {
      context.stop
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
