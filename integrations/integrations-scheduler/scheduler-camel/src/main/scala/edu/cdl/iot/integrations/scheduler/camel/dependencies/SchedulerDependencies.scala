package edu.cdl.iot.integrations.scheduler.camel.dependencies

import java.util.Properties

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.integrations.scheduler.camel.dependencies.SchedulerDependencies.defaultCamelProperties
import edu.cdl.iot.integrations.scheduler.camel.routes.TrainingSchedulerRoute
import org.apache.camel.CamelContext

object SchedulerDependencies {
  def defaultCamelProperties(): Properties = {
    val properties = new Properties()
    properties.setProperty("org.quartz.scheduler.instanceName", "PostgresScheduler")
    properties.setProperty("org.quartz.scheduler.instanceId", "AUTO")
    properties.setProperty("org.quartz.jobStore.class", "org.quartz.impl.jdbcjobstore.JobStoreTX")
    properties.setProperty("org.quartz.jobStore.driverDelegateClass", "org.quartz.impl.jdbcjobstore.PostgreSQLDelegate")
    properties.setProperty("org.quartz.jobStore.dataSource", "quartzDS")
    properties.setProperty("org.quartz.dataSource.quartzDS.driver", "org.postgresql.Driver")
    properties.setProperty("org.quartz.dataSource.quartzDS.URL", "jdbc:postgresql://127.0.0.1:5432/refit")
    properties.setProperty("org.quartz.dataSource.quartzDS.user", "refit")
    properties.setProperty("org.quartz.dataSource.quartzDS.password", "refit")
    properties.setProperty("org.quartz.jobStore.isClustered", "true")
    properties.setProperty("org.quartz.threadPool.class", "org.quartz.simpl.SimpleThreadPool")
    properties.setProperty("org.quartz.threadPool.threadCount", "25")
    properties.setProperty("org.quartz.threadPool.threadPriority", "5")
    properties.setProperty("org.quartz.jobStore.useProperties", "false")
    properties
  }
}

class SchedulerDependencies(config: RefitConfig,
                            context: CamelContext) {

  val properties: Properties = defaultCamelProperties()

  val timedRoutesBuilder = new TrainingSchedulerRoute(context)

}
