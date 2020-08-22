package edu.cdl.iot.db.fixtures.dto

import java.sql.Timestamp
import java.util.UUID

import edu.cdl.iot.common.schema.Schema


case class Project(orgGuid: UUID,
                   projectGuid: UUID,
                   name: String,
                   description: String,
                   timestamp: Timestamp,
                   schema: Schema)