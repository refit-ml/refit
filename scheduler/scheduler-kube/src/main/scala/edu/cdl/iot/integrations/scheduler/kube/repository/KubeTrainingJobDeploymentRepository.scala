package edu.cdl.iot.integrations.scheduler.kube.repository

import java.time.LocalDateTime

import edu.cdl.iot.integrations.scheduler.core.entity.{TrainingJob, TrainingJobDeployment, TrainingJobDeploymentStatus, TrainingJobError}
import edu.cdl.iot.integrations.scheduler.core.repository.TrainingJobDeploymentRepository
import io.kubernetes.client.openapi.Configuration
import io.kubernetes.client.openapi.apis.CoreV1Api
import io.kubernetes.client.openapi.models.{V1EnvVarBuilder, V1ObjectMetaBuilder, V1Pod}
import io.kubernetes.client.util.Config
import io.kubernetes.client.util.Yaml

import scala.collection.JavaConverters.{iterableAsScalaIterableConverter, seqAsJavaListConverter}


class KubeTrainingJobDeploymentRepository extends TrainingJobDeploymentRepository {

  private val client = Config.defaultClient
  Configuration.setDefaultApiClient(client)

  override def create(trainingJob: TrainingJob): Either[TrainingJobDeployment, TrainingJobError] = {
    val trainingJobYaml = getClass.getResourceAsStream("training-job.yaml")
      .readAllBytes
      .mkString

    val api = new CoreV1Api()
    val pod = Yaml.loadAs(trainingJobYaml, classOf[V1Pod])

    val metadata = new V1ObjectMetaBuilder()
      .addToAnnotations("name", trainingJob.jobName)
      .addToAnnotations("createdAt", LocalDateTime.now().toString)
      .addToAnnotations("cronExpression", trainingJob.cronExpression)
      .build()

    pod.setMetadata(metadata)
    val containers = pod.getSpec.getContainers.asScala
      .map(container =>
        container.addEnvItem(
          new V1EnvVarBuilder()
            .withName("REFIT_SCRIPT_LOCATION")
            .withValue(s"/${trainingJob.projectGuid}/scripts/${trainingJob.jobName}/")
            .build())
          .addEnvItem(
            new V1EnvVarBuilder()
              .withName("PROJECT_GUID")
              .withValue(trainingJob.projectGuid.toString)
              .build())
          .addEnvItem(
            new V1EnvVarBuilder()
              .withName("JOB_NAME")
              .withValue(trainingJob.jobName)
              .build())
      )
      .toList
      .asJava

    pod.getSpec.setContainers(containers)

    val result = api.createNamespacedPod("refit", pod, "true", null, null)


    Left(
      TrainingJobDeployment(
        name = trainingJob.jobName,
        status = TrainingJobDeploymentStatus.withName(result.getStatus.getPhase)))

  }
}
