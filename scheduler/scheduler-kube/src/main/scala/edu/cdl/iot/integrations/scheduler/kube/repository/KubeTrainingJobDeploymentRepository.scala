package edu.cdl.iot.integrations.scheduler.kube.repository

import java.io.FileReader

import edu.cdl.iot.integrations.scheduler.core.entity.{KubernetesApiConflict, TrainingJob, TrainingJobDeployment, TrainingJobDeploymentStatus, TrainingJobError, TrainingJobNotComplete}
import edu.cdl.iot.integrations.scheduler.core.repository.TrainingJobDeploymentRepository
import edu.cdl.iot.integrations.scheduler.kube.config.SchedulerKubeConfig
import io.kubernetes.client.openapi.{ApiException, Configuration}
import io.kubernetes.client.openapi.apis.BatchV1Api
import io.kubernetes.client.openapi.models.{V1DeleteOptionsBuilder, V1EnvVarBuilder, V1EnvVarSourceBuilder, V1Job, V1JobBuilder, V1SecretKeySelectorBuilder}
import io.kubernetes.client.util.{ClientBuilder, KubeConfig}
import org.slf4j.LoggerFactory

import scala.collection.JavaConverters.mapAsJavaMapConverter


class KubeTrainingJobDeploymentRepository(config: SchedulerKubeConfig) extends TrainingJobDeploymentRepository {

  private val kubeConfigPath = "/.kube/config"
  private val client =
    ClientBuilder.kubeconfig(KubeConfig.loadKubeConfig(new FileReader(kubeConfigPath))).build()

  private val logger = LoggerFactory.getLogger(classOf[KubeTrainingJobDeploymentRepository])

  Configuration.setDefaultApiClient(client)
  val api = new BatchV1Api()

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
      .withTtlSecondsAfterFinished(60)
      .withNewTemplate()
      .withNewSpec()
      .addNewContainer()
      .withEnv(
        new V1EnvVarBuilder()
          .withName("SCRIPT_LOCATION")
          .withValue(s"${trainingJob.projectGuid}/jobs/${trainingJob.jobName}/")
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
          .withName("MINIO_BUCKET")
          .withValue(config.minioBucket)
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
              .withName(s"${config.releasePrefix}-minio")
              .withKey("accesskey")
              .build())
            .build()
          ).build(),
        new V1EnvVarBuilder()
          .withName("MINIO_SECRET_KEY")
          .withValueFrom(new V1EnvVarSourceBuilder()
            .withSecretKeyRef(new V1SecretKeySelectorBuilder()
              .withName(s"${config.releasePrefix}-minio")
              .withKey("secretkey")
              .build())
            .build()
          ).build()
      )
      .withName("python-training")
      .withImage(s"cdliotprototype/cdl-refit-job:${config.refitVersion}")
      .endContainer()
      .withNodeSelector(
        Map("refit" -> "enabled").asJava
      )
      .withRestartPolicy("Never")
      .endSpec()
      .endTemplate()
      .endSpec()
      .build()

  private def availableToSchedule(trainingJob: TrainingJob): Boolean = {
    val jobName = s"refit-job-${trainingJob.jobName}"
    try {
      val response = api.readNamespacedJobStatus(jobName, config.namespace, "true")

      if (response != null) {
        val activeCount = response.getStatus.getActive
        if (activeCount == 0) {
          val deleteOptions = new V1DeleteOptionsBuilder()
            .build()
          api.deleteNamespacedJob(jobName, config.namespace, "true", null, null, false, null, deleteOptions)
          true
        }
        else {
          false
        }
      }
      else {
        true
      }
    }
    catch {
      case e: ApiException => {
        logger.error("Error deleting previous job", e)
        true
      }
    }
  }

  override def create(trainingJob: TrainingJob): Either[TrainingJobDeployment, TrainingJobError] = {


    try {
      if (availableToSchedule(trainingJob)) {
        val pod = buildPod(trainingJob)
        val result = api.createNamespacedJob(config.namespace, pod, "true", null, null)
        Left(
          TrainingJobDeployment(
            name = trainingJob.jobName,
            status = TrainingJobDeploymentStatus.withName(result.getStatus.toString)))
      }
      else {
        Right(TrainingJobNotComplete())
      }

    } catch {
      case e: Exception =>
        logger.error("Error scheduling job", e)
        Right(KubernetesApiConflict())
    }
  }
}
