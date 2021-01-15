package edu.cdl.iot.inference.core.evaluator

import java.io.{File, FileInputStream}
import java.nio.file.{Files, Paths}

import com.google.protobuf.ByteString
import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.common.util.SensorDataHelper
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}
import org.scalatest.BeforeAndAfterAll
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

class OnnxEvaluatorTests extends AnyFlatSpec with should.Matchers with BeforeAndAfterAll {
  val schemaDirectory = s"${System.getProperty("user.dir")}/common/src/main/resources/schema"

  val filename = s"${System.getProperty("user.dir")}/resources/data/models/demo.onnx"
  val schemaFileName = s"$schemaDirectory/demo.yaml"
  val projectGuid = "fake-project-guid"
  val modelKey = "fake-model-guid"
  val byteArray = Files.readAllBytes(Paths.get(filename))
  val model = new Model(
    projectGuid, modelKey, ByteString.copyFrom(byteArray), SerializationFormat.ONNX, List("temperature", "pressure", "wind"))

  val input = new FileInputStream(new File(schemaFileName))
  val schema = SchemaFactory.parse(input)

  val evaluator = EvaluatorFactory.getEvaluator(model, byteArray)


  "Model" should "Return OnnxEvaluator" in {
    val actual = EvaluatorFactory.getEvaluator(model, byteArray)
    actual.getClass should be(evaluator.getClass)
  }

  "Evaluation" should "return a map" in {
    val input = SensorDataHelper.getRandomReadings(schema, includeLabels = true)
    val output = evaluator.getPrediction(input)
    output should not be (null)
  }


  "Serialization" should "Work" in {
    val evaluator = EvaluatorFactory.getEvaluator(model, byteArray)
    val actual = evaluator.toByteArray
    actual should be(model.toByteArray)
  }
}