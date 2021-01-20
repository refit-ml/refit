package edu.cdl.iot.inference.core.evaluator

import edu.cdl.iot.inference.evaluators.PmmlEvaluator
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}

object EvaluatorFactory {
  def getEvaluator(model: Model, modelBytes: Array[Byte]): RefitEvaluator = model.format match {
    case SerializationFormat.PMML => new PmmlEvaluator(model, modelBytes)
    case SerializationFormat.ONNX => new OnnxEvaluator(model, modelBytes)
    case _ => new OnnxEvaluator(model, modelBytes)
  }
}
