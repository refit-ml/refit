package edu.cdl.iot.db.fixtures.schema

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.schema.factories.SchemaFactory

object Prototype {

  def dummy: Schema = SchemaFactory.getSchema("dummy")

  def baxter: Schema = SchemaFactory.getSchema("baxter")
}
