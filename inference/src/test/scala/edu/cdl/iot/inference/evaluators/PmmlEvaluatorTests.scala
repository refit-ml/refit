package edu.cdl.iot.inference.evaluators

import java.io.{File, FileInputStream}
import java.nio.file.{Files, Paths}

import com.google.protobuf.ByteString
import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.common.util.SensorDataHelper
import edu.cdl.iot.inference.util.EvaluatorFactory
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

class PmmlEvaluatorTests extends AnyFlatSpec with should.Matchers {
  val baseDir = if (sys.env.contains("GITHUB_WORKSPACE")) s"${sys.env("GITHUB_WORKSPACE").replace("iot-prototype/iot-prototype", "iot-prototype")}" else System.getProperty("user.dir")
  val filename = s"$baseDir/db/data/models/sample.pmml"
  val schemaFileName = s"$baseDir/db/data/schema/dummy.yaml"
  val projectGuid = "fake-project-guid"
  val modelKey = "fake-model-guid"
  val byteArray = Files.readAllBytes(Paths.get(filename))
  val bs = ByteString.copyFrom(byteArray)
  val model = new Model(projectGuid, modelKey, bs, SerializationFormat.PMML)

  val input = new FileInputStream(new File(schemaFileName))
  val schema = SchemaFactory.parse(input)


  "Model" should "Return PmmlEvaluator" in {
    val expected = new PmmlEvaluator(model)
    val actual = EvaluatorFactory.getEvaluator(model)
    actual.getClass should be(expected.getClass)
  }

  "Evaluation" should "return a map" in {
    val evaluator = EvaluatorFactory.getEvaluator(model)
    val input = SensorDataHelper.getRandomReadings(schema)
    val output = evaluator.getPrediction(input)
    output should not be (null)
  }

  "Serialization" should "Work" in {
    val evaluator = EvaluatorFactory.getEvaluator(model)
    val actual = evaluator.toByteArray
    actual should be(model.toByteArray)
  }
}