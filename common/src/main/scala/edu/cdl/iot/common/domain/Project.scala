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
    null,
    schema.name,
    "",
    TimestampHelper.toTimestamp(DateTime.now()),
    schema
  )
}

case class Project(orgGuid: UUID,
                   projectGuid: UUID,
                   modelGuid: UUID,
                   name: String,
                   description: String,
                   timestamp: Timestamp,
                   schema: Schema) {
  def getOrgGuid: UUID = orgGuid
  def getProjectGuid: UUID = projectGuid
  def getModelGuid: UUID = modelGuid
  def getName: String = name
  def getDescription: String = description
  def getTimestamp: Timestamp = timestamp
  def getSchema: Schema = schema
}