package edu.cdl.iot.integrations.notebook.core.service

import java.util.UUID

import edu.cdl.iot.common.domain.{Project, TrainingWindow}
import edu.cdl.iot.integrations.notebook.core.entity.{Model => ModelRequest}
import edu.cdl.iot.integrations.notebook.core.repository._
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}
import org.joda.time.DateTime
import org.slf4j.LoggerFactory


class NotebookModelService(projectRepository: NotebookProjectRepository,
                           modelRepository: NotebookModelRepository) {

  private val logger = LoggerFactory.getLogger(classOf[NotebookModelService])

  def updateModel(projectGuid: UUID, request: ModelRequest): Project = {
    val project = projectRepository.find(projectGuid)
    val modelGuid = UUID.fromString(request.modelGuid)
    logger.info(s"Queue model update with model located at: ${request.path}")
    val updatedProject = project.copy(modelGuid = modelGuid)
    val model = Model(
      projectGuid = projectGuid.toString,
      modelGuid = request.modelGuid,
      path = request.path,
      format = SerializationFormat.ONNX,
      inputValues = request.getInputFields
    )

    projectRepository.save(updatedProject)
    modelRepository.save(model)

    updatedProject
  }
}
