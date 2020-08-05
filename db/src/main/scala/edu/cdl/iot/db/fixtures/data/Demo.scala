package edu.cdl.iot.db.fixtures.data

import java.sql.Timestamp
import java.util.UUID

import edu.cdl.iot.db.fixtures.dto.{Org, Project}
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat

object Demo {
  private val creationTime = new Timestamp(
    DateTime.parse(
      "2020-07-30 00:28:57",
      DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss"))
      .getMillis
  )

  val org: Org = Org(UUID.fromString("62ab599b-787f-4f05-ab09-60dbde85d9db"),
    creationTime,
    "Demo Org")

  val demoProject: Project = Project(org.orgGuid,
    UUID.fromString("17dc3d85-188a-4162-b0d7-9f561f3791d1"),
    "Demo Project",
    "Random data to test the integration of the system",
    creationTime
  )

  val baxterProject: Project = Project(org.orgGuid,
    UUID.fromString("d653e000-8c5d-4f3d-92c9-affa9cf9936a"),
    "Baxter Data Project",
    "Actual histroical data, for model training",
    creationTime
  )
}
