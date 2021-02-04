package edu.cdl.iot.integrations.scheduler.jdbi.mapper

import java.sql.ResultSet
import java.time.LocalDateTime
import java.util.UUID

import edu.cdl.iot.integrations.scheduler.core.entity.TrainingJob
import org.jdbi.v3.core.mapper.RowMapper
import org.jdbi.v3.core.statement.StatementContext

class TrainingJobMapper extends RowMapper[TrainingJob] {
  override def map(rs: ResultSet, ctx: StatementContext): TrainingJob =
    new TrainingJob(
      projectGuid = rs.getObject("projectGuid", classOf[UUID]),
      jobName = rs.getObject("jobName", classOf[String]),
      cronExpression = rs.getObject("cronExpression", classOf[String]),
      createdAt = rs.getObject("createdAt", classOf[LocalDateTime])
    )
}
