package edu.cdl.iot.db.fixtures

import edu.cdl.iot.db.fixtures.dao.FixtureDao
import edu.cdl.iot.db.fixtures.data.Demo
import edu.cdl.iot.db.fixtures.dto.{Org, Project}

object Fixtures {

  def build(): Unit = {
    organizations.foreach(FixtureDao.createOrg)
    projects.foreach(FixtureDao.createProject)
  }

  val organizations: List[Org] = List(Demo.org)
  val projects: List[Project] = List(Demo.demoProject, Demo.baxterProject)

}

