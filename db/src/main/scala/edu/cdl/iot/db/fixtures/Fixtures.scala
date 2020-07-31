package edu.cdl.iot.db.fixtures

import java.sql.Timestamp
import java.time.Instant
import java.util.{Properties, UUID}

import edu.cdl.iot.db.fixtures.dao.FixtureDao
import edu.cdl.iot.db.fixtures.data.Demo
import edu.cdl.iot.db.fixtures.dto.{Org, Project}
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import org.skife.jdbi.v2.DBI

object Fixtures {

  def build(host: String, user: String, password: String, keyspace: String): Unit = {
    val props = new Properties()
    props.setProperty("user", user)
    props.setProperty("password", password)
    val jdbi = new DBI(s"jdbc:cassandra://${host}:9160/${keyspace}", props)
    val handle = jdbi.open()
    try {

      val dao = handle.attach(classOf[FixtureDao])
      val x = organizations(0)

      organizations.foreach(x => dao.createOrg(x.orgGuid.toString, x.name, x.timestamp))
      projects.foreach(x => dao.createProject(x.orgGuid.toString, x.projectGuid.toString, x.name, x.timestamp))
    }
    finally {
      handle.close()
    }
  }

  val organizations: List[Org] = List(Demo.org)
  val projects: List[Project] = List(Demo.demoProject, Demo.baxterProject)

}

