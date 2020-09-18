package edu.cdl.iot.db.fixtures

import java.util.UUID

import edu.cdl.iot.common.factories.{ConfigFactory, SchemaFactory}
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.db.fixtures.`import`.ImportHelper
import edu.cdl.iot.db.fixtures.dao.FixtureDao
import edu.cdl.iot.db.fixtures.dto.{Org, Project}
import org.joda.time.DateTime


object Main {
  val loadTrainingWindow = true
  val loadSensorData = false
  val schemaDirectory = "SCHEMA_DIRECTORY"
  val retryTimeout = 10 * 1000

  def main(args: Array[String]): Unit = {
    var success = false
    var count = 0;
    while (!success || count > 10) {
      count = count + 1
      try {
        applyMigrations()
        success = true
      }
      catch {
        case _: Exception => {
          println("Error Applying fixtures, try again in 10s")
          Thread.sleep(retryTimeout)
        }
      }
    }
    sys.exit(0)
  }

  def applyMigrations() = {
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

    try {
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
    catch {
      case e: Exception =>
        println("There was an error importing data")
        System.exit(1)
    }
    System.exit(0)
  }

}
