package edu.cdl.iot.common.schema.factories

import java.io.{File, FileInputStream, InputStream}

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.schema.yaml.SchemaYaml
import org.yaml.snakeyaml.Yaml


object SchemaFactory {
  def parse(input: String): Schema = {
    val yaml = new Yaml
    Schema(yaml.loadAs(input, classOf[SchemaYaml]))
  }

  def parse(input: InputStream): Schema = {
    val yaml = new Yaml
    Schema(yaml.loadAs(input, classOf[SchemaYaml]))
  }

  def getSchema(name: String): Schema = {
    val schemaFile = s"${System.getProperty("user.dir")}/db/data/schema/$name.yaml"
    SchemaFactory.parse(new FileInputStream(new File(schemaFile)))
  }
}