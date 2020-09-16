package edu.cdl.iot.inference.util

import edu.cdl.iot.inference.evaluators.{IRefitEvaluator, OnnxEvaluator, PmmlEvaluator}
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}

object EvaluatorFactory {
  def getEvaluator(model: Model): IRefitEvaluator = model.format match {
    case SerializationFormat.PMML => new PmmlEvaluator(model)
    case SerializationFormat.ONNX => new OnnxEvaluator(model)
    case _ => new OnnxEvaluator(model)
  }

  def getEvaluator(model: Array[Byte]): IRefitEvaluator = getEvaluator(Model.parseFrom(model))
}
