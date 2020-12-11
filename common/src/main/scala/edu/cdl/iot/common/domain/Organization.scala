package edu.cdl.iot.common.domain

import java.sql.Timestamp
import java.util.UUID

case class Organization(orgGuid: UUID,
                        timestamp: Timestamp,
                        name: String)
