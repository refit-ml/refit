package edu.cdl.iot.integrations.scheduler.core.entity


import java.time.LocalDateTime
import java.util.UUID

case class TrainingJob(projectGuid: UUID,
                       jobName: String,
                       cronExpression: String,
                       createdAt: LocalDateTime)
