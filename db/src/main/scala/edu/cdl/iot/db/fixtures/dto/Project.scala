package edu.cdl.iot.db.fixtures.dto

import java.sql.Timestamp
import java.util.UUID


case class Project(orgGuid: UUID,
                   projectGuid: UUID,
                   name: String,
                   description: String,
                   timestamp: Timestamp)