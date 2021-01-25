package edu.cdl.iot.integrations.scheduler.camel.routes

import org.apache.camel.{CamelContext, Exchange}
import org.apache.camel.builder.RouteBuilder
import org.slf4j.LoggerFactory

class TrainingSchedulerRoute(context: CamelContext) extends RouteBuilder(context) {
  val logger = LoggerFactory.getLogger(classOf[TrainingSchedulerRoute])

  override def configure(): Unit = {
    from("quartz://timerName?cron=0/30+*+*+*+*+?")
      .process((exchange: Exchange) => {
        logger.info("I am here! scheduling")
      })
  }
}
