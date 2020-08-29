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

class OnnxEvaluatorTests extends AnyFlatSpec with should.Matchers {
  val filename = s"${System.getProperty("user.dir")}/db/data/models/sample.onnx"
  val schemaFileName = s"${System.getProperty("user.dir")}/db/data/schema/baxter.yaml"
  val projectGuid = "fake-project-guid"
  val modelKey = "fake-model-guid"

  val input = new FileInputStream(new File(schemaFileName))
  val schema = SchemaFactory.parse(input)


  "Evaluation" should "return a map" in {
    val byteArray = Files.readAllBytes(Paths.get(filename))
    val bs = ByteString.copyFrom(byteArray)
    val model = new Model(projectGuid, modelKey, bs, SerializationFormat.ONNX)
    val evaluator = EvaluatorFactory.getEvaluator(model)
    val input = SensorDataHelper.getRandomReadings(schema)
    val output = evaluator.getPrediction(input)
    output should not be (null)
    // TODO build sensor data based on schema

  }
}