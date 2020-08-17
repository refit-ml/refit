package edu.cdl.iot.db.fixtures

import java.util.Properties

import edu.cdl.iot.camel.fixtures.dao.FixtureDao
import edu.cdl.iot.db.fixtures.dto.{Org, Project}
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
}

