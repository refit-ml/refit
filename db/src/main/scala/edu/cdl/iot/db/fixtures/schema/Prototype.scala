package edu.cdl.iot.db.fixtures.schema

import java.io.{File, FileInputStream}

import edu.cdl.iot.common.schema.{Schema, SchemaFactory}

object Prototype {
  def getSchema(name: String): Schema = {
    val schemaFile = s"${System.getProperty("user.dir")}/db/data/schema/${name}.yaml"
    SchemaFactory.parse(new FileInputStream(new File(schemaFile)))
  }

  def dummy: Schema = getSchema("dummy")

  def baxter: Schema = getSchema("baxter")
}
