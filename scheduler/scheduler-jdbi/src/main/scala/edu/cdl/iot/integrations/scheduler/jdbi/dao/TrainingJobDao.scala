package edu.cdl.iot.integrations.scheduler.jdbi.dao

import java.time.LocalDateTime
import java.util.UUID

import edu.cdl.iot.integrations.scheduler.core.entity.TrainingJob
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper
import org.jdbi.v3.sqlobject.customizer.Bind
import org.jdbi.v3.sqlobject.statement.{SqlQuery, SqlUpdate}


trait TrainingJobDao {

  @SqlQuery(
    """
      select project_guid    projectGuid,
             job_name        jobName,
             cron_expression cronExpression,
             created_at      createdAt
      from REFIT_JOBS;
      """)
  def findAllTrainingJobs(): java.util.List[TrainingJob]

  @SqlQuery(
    """
      SELECT project_guid    projectGuid,
             job_name        jobName,
             cron_expression cronExpression,
             created_at      createdAt
      FROM REFIT_JOBS
      WHERE project_guid = :project_guid;
      """)
  def findTrainingJobsInProject(@Bind("project_guid") projectGuid: UUID): java.util.List[TrainingJob]


  @SqlQuery(
    """
      SELECT project_guid    projectGuid,
             job_name        jobName,
             cron_expression cronExpression,
             created_at      createdAt
      FROM REFIT_JOBS
      WHERE project_guid = :project_guid
      AND job_name = :name
      """)
  def findTrainingJobById(@Bind("project_guid") projectGuid: UUID, @Bind("name") name: String): TrainingJob


  @SqlUpdate(
    """
      INSERT INTO REFIT_JOBS (project_guid, job_name, cron_expression, created_at)
      VALUES (:project_guid, :name, :cron, :created_at)
      ON CONFLICT (project_guid, job_name)
      DO UPDATE
        SET cron_expression = EXCLUDED.cron_expression,
            created_at = EXCLUDED.created_at;
      """)
  def save(@Bind("project_guid") projectGuid: UUID,
           @Bind("name") name: String,
           @Bind("cron") cronExpression: String,
           @Bind("created_at") createdAt: LocalDateTime)

  @SqlUpdate(
    """
      DELETE FROM REFIT_JOBS
      WHERE project_guid = :project_guid
      AND job_name = :name
      """)
  def delete(@Bind("project_guid") projectGuid: UUID,
             @Bind("name") name: String)
}
