package edu.cdl.iot.db.fixtures

import edu.cdl.iot.common.factories.{ConfigFactory, SchemaFactory}
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.db.fixtures.`import`.ImportHelper
import edu.cdl.iot.db.fixtures.dao.FixtureDao
import edu.cdl.iot.db.fixtures.dto.{Org, Project}
import org.joda.time.DateTime


object Main {
  val loadTrainingWindow = false
  val loadSensorData = false
  val schemaDirectory = "SCHEMA_DIRECTORY"

  def main(args: Array[String]): Unit = {
    val configFactory = new ConfigFactory()
    val config = configFactory.getConfig

    val fixtureDao = new FixtureDao(config.getCassandraConfig())


    val schemas =
      if (sys.env.contains(schemaDirectory))
        SchemaFactory.getSchemas(sys.env(schemaDirectory))
      else SchemaFactory.getSchemas

    
    val orgs = schemas.map(x => Org(x.orgGuid,
      TimestampHelper.toTimestamp(DateTime.now()),
      x.org
    ))
    val projects = schemas.map(Project.fromSchema)

    println("Create Orgs")
    orgs.foreach(fixtureDao.createOrg)
    println("Create Projects")
    projects.foreach(fixtureDao.createProject)

    if (loadSensorData || loadTrainingWindow) {
      println("Import data")
      schemas.foreach(schema => {
        ImportHelper.importData(config, fixtureDao, schema, loadSensorData, loadTrainingWindow)
      })
    }

    println("Done")
    fixtureDao.close()
  }

}
