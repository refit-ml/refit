package edu.cdl.iot.db.fixtures.`import`

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.db.fixtures.dao.FixtureDao
import edu.cdl.iot.db.fixtures.dto.Sensor

import scala.collection.mutable

object ImportHelper {
  val batchSize = 5

  def importData(config: RefitConfig,
                 fixtureDao: FixtureDao,
                 schema: Schema,
                 loadSensorData: Boolean,
                 loadTrainingWindow: Boolean): Any = {

    val encryptionHelper = new EncryptionHelper(config.getEncryptionKey(), schema.projectGuid.toString)

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
}
