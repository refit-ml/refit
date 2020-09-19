package edu.cdl.iot.ingestion.dto

import java.sql.Timestamp
import java.util.UUID

case class Org(orgGuid: UUID,
               timestamp: Timestamp,
               name: String)
