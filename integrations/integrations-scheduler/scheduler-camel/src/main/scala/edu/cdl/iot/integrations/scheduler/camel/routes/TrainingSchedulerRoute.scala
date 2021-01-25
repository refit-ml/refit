package edu.cdl.iot.integrations.scheduler.camel.routes

import org.apache.camel.{CamelContext, Exchange}
import org.apache.camel.builder.RouteBuilder
import org.quartz.{JobDataMap, JobDetail}
import org.quartz.impl.JobDetailImpl
import org.slf4j.LoggerFactory

import scala.collection.JavaConverters.mapAsJavaMapConverter

class TrainingSchedulerRoute(context: CamelContext) extends RouteBuilder(context) {
  val logger = LoggerFactory.getLogger(classOf[TrainingSchedulerRoute])

  override def configure(): Unit = {

    context.getRegistry.bind("p1", Map("one" -> "two").asJava)

    from("quartz://demo-project/test-timer?cron=0/30+*+*+*+*+?&jobParameters=#bean:p1")
      .process((exchange: Exchange) => {
        val message = exchange.getIn()
        val jobDetail = message.getHeader("jobDetail", classOf[JobDetail])
        val projectGuid = jobDetail.getKey.getGroup
        val jobId = jobDetail.getKey.getName
        logger.info("I am here! scheduling")
      })
  }
}
