package edu.cdl.iot.db.fixtures.data

import java.sql.Timestamp
import java.util.UUID

import edu.cdl.iot.db.fixtures.dto.{Org, Project}
import edu.cdl.iot.db.fixtures.schema.Prototype
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
    UUID.fromString("b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"),
    "Demo Project",
    "Random data to test the integration of the system",
    creationTime,
    Prototype.dummy
  )

  val baxterProject: Project = Project(org.orgGuid,
    UUID.fromString("e41aa8e4-d79b-4bcc-b5d4-45eb457e6f93"),
    "Baxter Data Project",
    "Actual histroical data, for model training",
    creationTime,
    Prototype.baxter
  )
}
