package edu.cdl.iot.ingestion.core.service

import com.google.protobuf.ByteString
import edu.cdl.iot.ingestion.core.dto.request.ModelRequest
import edu.cdl.iot.ingestion.core.dto.response.ModelResponse
import edu.cdl.iot.ingestion.core.repository.{ModelFileRepository, ModelRepository}
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}

class ModelService(modelRepository: ModelRepository,
                   modelFileRepository: ModelFileRepository) {

  def updateModel(request: ModelRequest): ModelResponse = {
    val modelBytes = modelFileRepository.getModel(request.path)
    val model = Model(request.projectGuid,
      request.modelGuid,
      ByteString.copyFrom(modelBytes),
      SerializationFormat.ONNX,
      request.getInputFields
    )
    modelRepository.saveModel(model)

    new ModelResponse(requestSuccessful = true)
  }

}
