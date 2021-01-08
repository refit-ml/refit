package edu.cdl.iot.common.domain

import java.sql.Timestamp
import java.util.UUID

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.util.TimestampHelper
import org.joda.time.DateTime


object Project {
  def fromSchema(schema: Schema): Project = Project(
    schema.orgGuid,
    schema.projectGuid,
    schema.name,
    "",
    TimestampHelper.toTimestamp(DateTime.now()),
    schema
  )
}

case class Project(orgGuid: UUID,
                   projectGuid: UUID,
                   name: String,
                   description: String,
                   timestamp: Timestamp,
                   schema: Schema) {

}
