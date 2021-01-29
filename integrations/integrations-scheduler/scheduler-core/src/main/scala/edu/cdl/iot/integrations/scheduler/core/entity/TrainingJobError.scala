package edu.cdl.iot.integrations.scheduler.core.entity

sealed class TrainingJobError(message: String)


case class InvalidCronExpression(cronExpression: String)
  extends TrainingJobError(s"The provided cron expression ($cronExpression) is invalid")

case class SchedulerUnavailable()
  extends TrainingJobError("The REFIT training scheduler is unavailable")