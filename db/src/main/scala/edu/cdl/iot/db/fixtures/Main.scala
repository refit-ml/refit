package edu.cdl.iot.db.fixtures

import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.ConfigHelper
import edu.cdl.iot.db.fixtures.`import`.{SensorDataImport, TrainingWindowImport}
import edu.cdl.iot.db.fixtures.dao.FixtureDao
import edu.cdl.iot.db.fixtures.dto.Sensor
import edu.cdl.iot.db.fixtures.schema.Prototype

import scala.collection.mutable

object Main {
  def main(args: Array[String]): Unit = {
    val encryptionKey = ConfigHelper.env("ENCRYPTION_KEY", "keyboard_cat")
    val batchSize = 5
    val schema = Prototype.baxter
    val encryptionHelper = new EncryptionHelper(encryptionKey, schema.projectGuid.toString)
    val loadTrainingWindow = false
    val loadSensorData = true


    println("Create schema fixtures ...")
    Fixtures.build()

    if (loadTrainingWindow || loadSensorData) {
      if (loadSensorData) {
        println("Importing Sensor Data")
        val data = SensorDataImport.load(schema, encryptionHelper)
        println("Saving Sensor Data")
//        data.grouped(batchSize).map(FixtureDao.createSensorData).toList

        val sensors = new mutable.HashMap[String, Sensor]

        data.foreach(x => {
          sensors.getOrElseUpdate(x.sensor_id, {
            Sensor(x.project_guid, x.sensor_id, x.timestamp)
          })
        })
        println("Create Sensors")
        sensors.values.toList.grouped(batchSize).map(FixtureDao.createSensor).toList

      }

      if (loadTrainingWindow) {
        println("Importing training window data")
        val data = TrainingWindowImport.load(schema)
        println("Saving training window data")
        data.grouped(batchSize).map(FixtureDao.createTrainingWindow).toList
      }
    }
    println("Done")
    FixtureDao.close()
  }

}
