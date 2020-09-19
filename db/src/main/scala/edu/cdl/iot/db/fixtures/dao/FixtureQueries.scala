package edu.cdl.iot.db.fixtures.dao

case class FixtureQueries(keyspace: String) {
  val createOrg: String =
    s"""
       |INSERT INTO $keyspace.org (org_guid, name, timestamp)
       |VALUES (?, ?, ?)
       |""".stripMargin

  val createProject: String =
    s"""
       |INSERT INTO $keyspace.project (org_guid, project_guid, name, "schema", timestamp)
       |VALUES (?, ?, ?, ?, ?)
       |""".stripMargin

}
