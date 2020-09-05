package edu.cdl.iot.db.fixtures

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.db.fixtures.`import`.{SensorDataImport, TrainingWindowImport}
import edu.cdl.iot.db.fixtures.dao.FixtureDao
import edu.cdl.iot.db.fixtures.dto.Sensor
import edu.cdl.iot.db.fixtures.schema.Prototype

import scala.collection.mutable

object Main {
  def main(args: Array[String]): Unit = {
    val configFactory = new ConfigFactory()
    val config = configFactory.getConfig

    val encryptionKey = config.getEncryptionKey()
    val fixtureDao = new FixtureDao(config.getCassandraConfig())


    val batchSize = 5
    val schema = Prototype.dummy
    val encryptionHelper = new EncryptionHelper(encryptionKey, schema.projectGuid.toString)
    val loadTrainingWindow = false
    val loadSensorData = false


    println("Create schema fixtures ...")
    Fixtures.build(fixtureDao)

    if (loadTrainingWindow || loadSensorData) {
      if (loadSensorData) {
        println("Importing Sensor Data")
        val data = SensorDataImport.load(schema, encryptionHelper)
        println("Saving Sensor Data")
        data.grouped(batchSize).map(fixtureDao.createSensorData).toList

        val sensors = new mutable.HashMap[String, Sensor]

        data.foreach(x => {
          sensors.getOrElseUpdate(x.sensor_id, {
            Sensor(x.project_guid, x.sensor_id, x.timestamp)
          })
        })
        println("Create Sensors")
        sensors.values.toList.grouped(batchSize).map(fixtureDao.createSensor).toList

      }

      if (loadTrainingWindow) {
        println("Importing training window data")
        val data = TrainingWindowImport.load(schema)
        println("Saving training window data")
        data.grouped(batchSize).map(fixtureDao.createTrainingWindow).toList
      }
    }
    println("Done")
    fixtureDao.close()
  }

}
