package edu.cdl.iot.common.factories

import java.io.{File, FileInputStream, InputStream}

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.yaml.SchemaYaml
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
    val fileName = s"/schema/$name.yaml"
    val fileStream = getClass.getResourceAsStream(fileName)
    SchemaFactory.parse(fileStream)
  }

  def getSchemas: List[Schema] = getSchemas(getClass.getResource("/schema/").getPath)

  def getSchemas(rootDirectory: String): List[Schema] = {
    val directory = new File(rootDirectory)
    directory
      .listFiles()
      .map(file => parse(new FileInputStream(file)))
      .toList
  }
}