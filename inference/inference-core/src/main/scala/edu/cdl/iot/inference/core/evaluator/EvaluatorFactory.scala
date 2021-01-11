package edu.cdl.iot.inference.core.evaluator

import edu.cdl.iot.inference.evaluators.PmmlEvaluator
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}

object EvaluatorFactory {
  def getEvaluator(model: Model): RefitEvaluator = model.format match {
    case SerializationFormat.PMML => new PmmlEvaluator(model)
    case SerializationFormat.ONNX => new OnnxEvaluator(model)
    case _ => new OnnxEvaluator(model)
  }

  def getEvaluator(model: Array[Byte]): RefitEvaluator = getEvaluator(Model.parseFrom(model))
}
