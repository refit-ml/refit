package edu.cdl.iot.integrations.scheduler.kube.repository

import edu.cdl.iot.integrations.scheduler.core.entity.{TrainingJob, TrainingJobDeployment, TrainingJobDeploymentStatus, TrainingJobError}
import edu.cdl.iot.integrations.scheduler.core.repository.TrainingJobDeploymentRepository
import io.kubernetes.client.openapi.Configuration
import io.kubernetes.client.openapi.apis.BatchV1Api
import io.kubernetes.client.openapi.models.{V1EnvVarBuilder, V1Job, V1JobBuilder}
import io.kubernetes.client.util.Config

import scala.collection.JavaConverters.mapAsJavaMapConverter


class KubeTrainingJobDeploymentRepository extends TrainingJobDeploymentRepository {

  private val client = Config.defaultClient
  Configuration.setDefaultApiClient(client)

  def buildPod(trainingJob: TrainingJob): V1Job =
    new V1JobBuilder()
      .withNewMetadata()
      .withName(s"refit-job-${trainingJob.jobName}")
      .withLabels(Map(
        "project" -> trainingJob.projectGuid.toString,
        "job" -> trainingJob.jobName,
      ).asJava)
      .endMetadata()
      .withApiVersion("batch/v1")
      .withKind("Job")
      .withNewSpec()
      .withNewTemplate()
      .withNewSpec()
      .addNewContainer()
      .withEnv(
        new V1EnvVarBuilder()
          .withName("REFIT_SCRIPT_LOCATION")
          .withValue(s"/${trainingJob.projectGuid}/scripts/${trainingJob.jobName}/")
          .build(),
        new V1EnvVarBuilder()
          .withName("PROJECT_GUID")
          .withValue(trainingJob.projectGuid.toString)
          .build(),
        new V1EnvVarBuilder()
          .withName("JOB_NAME")
          .withValue(trainingJob.jobName)
          .build()
      )
      .withName("python-training")
      .withImage("cdliotprototype/cdl-refit-training-job:latest")
      .withCommand("./app/run.sh")
      .endContainer()
      .withRestartPolicy("Never")
      .endSpec()
      .endTemplate()
      .endSpec()
      .build()


  override def create(trainingJob: TrainingJob): Either[TrainingJobDeployment, TrainingJobError] = {
    val api = new BatchV1Api()
    val pod = buildPod(trainingJob)
    val result = api.createNamespacedJob("refit", pod, "true", null, null)

    Left(
      TrainingJobDeployment(
        name = trainingJob.jobName,
        status = TrainingJobDeploymentStatus.withName(result.getStatus.toString)))
  }
}
