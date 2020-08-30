package edu.cdl.iot.inference.evaluators

import java.io.{File, FileInputStream}
import java.nio.file.{Files, Paths}

import com.google.protobuf.ByteString
import edu.cdl.iot.common.schema.factories.SchemaFactory
import edu.cdl.iot.common.util.SensorDataHelper
import edu.cdl.iot.inference.util.EvaluatorFactory
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

class PmmlEvaluatorTests extends AnyFlatSpec with should.Matchers {
  val filename = s"${System.getProperty("user.dir")}/db/data/models/sample.pmml"
  val schemaFileName = s"${System.getProperty("user.dir")}/db/data/schema/dummy.yaml"
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
    actual should be (model.toByteArray)
  }
}