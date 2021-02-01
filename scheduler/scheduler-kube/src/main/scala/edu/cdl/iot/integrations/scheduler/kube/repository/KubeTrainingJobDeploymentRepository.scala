package edu.cdl.iot.integrations.scheduler.kube.repository

import edu.cdl.iot.integrations.scheduler.core.entity.{TrainingJob, TrainingJobDeployment, TrainingJobDeploymentStatus, TrainingJobError}
import edu.cdl.iot.integrations.scheduler.core.repository.TrainingJobDeploymentRepository
import edu.cdl.iot.integrations.scheduler.kube.config.SchedulerKubeConfig
import io.kubernetes.client.openapi.Configuration
import io.kubernetes.client.openapi.apis.BatchV1Api
import io.kubernetes.client.openapi.models.{V1EnvVarBuilder, V1EnvVarSourceBuilder, V1Job, V1JobBuilder, V1SecretKeySelectorBuilder}
import io.kubernetes.client.util.Config

import scala.collection.JavaConverters.mapAsJavaMapConverter


class KubeTrainingJobDeploymentRepository(config: SchedulerKubeConfig) extends TrainingJobDeploymentRepository {

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
          .withName("SCRIPT_LOCATION")
          .withValue(s"${trainingJob.projectGuid}/scripts/${trainingJob.jobName}/")
          .build(),
        new V1EnvVarBuilder()
          .withName("SCRIPT_FILE")
          .withValue("index.py")
          .build(),
        new V1EnvVarBuilder()
          .withName("PROJECT_GUID")
          .withValue(trainingJob.projectGuid.toString)
          .build(),
        new V1EnvVarBuilder()
          .withName("JOB_NAME")
          .withValue(trainingJob.jobName)
          .build(),
        new V1EnvVarBuilder()
          .withName("MINIO_HOST")
          .withValue(config.minioHost)
          .build(),
        new V1EnvVarBuilder()
          .withName("MINIO_ACCESS_KEY")
          .withValueFrom(new V1EnvVarSourceBuilder()
            .withSecretKeyRef(new V1SecretKeySelectorBuilder()
              .withKey(s"${config.releasePrefix}-minio")
              .withName("accesskey")
              .build())
            .build()
          ).build(),
        new V1EnvVarBuilder()
          .withName("MINIO_ACCESS_KEY")
          .withValueFrom(new V1EnvVarSourceBuilder()
            .withSecretKeyRef(new V1SecretKeySelectorBuilder()
              .withKey(s"${config.releasePrefix}-minio")
              .withName("secretkey")
              .build())
            .build()
          ).build()
      )
      .withName("python-training")
      .withImage("cdliotprototype/cdl-refit-job:latest")
      .endContainer()
      .withRestartPolicy("Never")
      .endSpec()
      .endTemplate()
      .endSpec()
      .build()


  override def create(trainingJob: TrainingJob): Either[TrainingJobDeployment, TrainingJobError] = {
    val api = new BatchV1Api()
    val pod = buildPod(trainingJob)
    val result = api.createNamespacedJob(config.namespace, pod, "true", null, null)

    Left(
      TrainingJobDeployment(
        name = trainingJob.jobName,
        status = TrainingJobDeploymentStatus.withName(result.getStatus.toString)))
  }
}
