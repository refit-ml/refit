package edu.cdl.iot.integrations.scheduler.core.entity

import java.util.UUID

sealed class TrainingJobError(val message: String)


case class InvalidCronExpression(cronExpression: String)
  extends TrainingJobError(s"The provided cron expression ($cronExpression) is invalid")

case class SchedulerUnavailable()
  extends TrainingJobError("The REFIT training scheduler is unavailable")

case class TrainingJobNotFound(projectGuid: UUID, jobName: String)
  extends TrainingJobError(s"The training job $jobName in project $projectGuid does not exist")

case class KubernetesApiConflict()
  extends TrainingJobError("The kubernetes api has returned an error")

case class TrainingJobNotComplete()
  extends TrainingJobError("There is an existing training job in flight, new job cannot be scheduled")