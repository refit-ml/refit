package edu.cdl.iot.inference.evaluators

import java.io.{File, FileInputStream}
import java.nio.file.{Files, Paths}

import com.google.protobuf.ByteString
import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.common.util.SensorDataHelper
import edu.cdl.iot.inference.util.EvaluatorFactory
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}
import org.scalatest.BeforeAndAfterAll
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

class OnnxEvaluatorTests extends AnyFlatSpec with should.Matchers with BeforeAndAfterAll {
  val filename = s"${System.getProperty("user.dir")}/db/data/models/sample.onnx"
  val schemaFileName = s"${System.getProperty("user.dir")}/db/data/schema/medical-devices.yaml"
  val projectGuid = "fake-project-guid"
  val modelKey = "fake-model-guid"
  val byteArray = Files.readAllBytes(Paths.get(filename))
  val bs = ByteString.copyFrom(byteArray)
  val model = new Model(projectGuid, modelKey, bs, SerializationFormat.ONNX)

  val input = new FileInputStream(new File(schemaFileName))
  val schema = SchemaFactory.parse(input)

  val evaluator = EvaluatorFactory.getEvaluator(model)


  "Model" should "Return OnnxEvaluator" in {
    val actual = EvaluatorFactory.getEvaluator(model)
    actual.getClass should be(evaluator.getClass)
  }

  "Evaluation" should "return a map" in {
    val input = SensorDataHelper.getRandomReadings(schema, includeLabels = true)
    val output = evaluator.getPrediction(input)
    output should not be (null)
  }

  "Serialization" should "Work" in {
    val evaluator = EvaluatorFactory.getEvaluator(model)
    val actual = evaluator.toByteArray
    actual should be(model.toByteArray)
  }
}