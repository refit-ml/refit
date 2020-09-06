package edu.cdl.iot.common.security

import java.io.{File, FileInputStream}
import java.util.UUID

import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.common.schema.enums.FieldClassification
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

class SchemaTests extends AnyFlatSpec with should.Matchers {
  val filename = s"${System.getProperty("user.dir")}/db/data/schema/dummy.yaml"


  "Schema" should "Parse name" in {
    val expected = "Dummy"
    val input = new FileInputStream(new File(filename))
    val actual = SchemaFactory.parse(input)
    actual should not be (null)
    actual.name should be(expected)
  }

  "Schema Parsing" should "Parse GUIDs" in {
    val expected = UUID.fromString("b6ee5bab-08dd-49b0-98b6-45cd0a28b12f")
    val input = new FileInputStream(new File(filename))
    val actual = SchemaFactory.parse(input)

    actual should not be (null)
    actual.projectGuid should be(expected)

  }

  "Schema Parsing" should "Parse import options" in {
    val expected = true
    val input = new FileInputStream(new File(filename))
    val actual = SchemaFactory.parse(input)

    actual should not be (null)
    actual.importOptions should not be (null)
    actual.importOptions.includesHeader should be(expected)
  }

  "Schema Parsing" should "Load features" in {
    val input = new FileInputStream(new File(filename))
    val actual = SchemaFactory.parse(input)

    actual should not be (null)
    actual.fields should not be (null)
    actual.fields.size should be(9)
    actual.fields.head.name should be("Auto-Increment")
    actual.fields.head.`type` should be(edu.cdl.iot.common.schema.enums.FieldType.Integer)
    actual.fields.head.classification should be(FieldClassification.ThrowAway)
  }

  "Schema Parsing" should "Should work for medical devices schema" in {
    val filename = s"${System.getProperty("user.dir")}/db/data/schema/medical-devices.yaml"
    val input = new FileInputStream(new File(filename))
    val actual = SchemaFactory.parse(input)

    actual should not be (null)
    actual.fields should not be (null)
    actual.fields.size should be(49)
  }
}
