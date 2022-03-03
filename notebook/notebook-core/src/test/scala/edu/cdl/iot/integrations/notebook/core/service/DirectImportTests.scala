package edu.cdl.iot.integrations.notebook.core.service

import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.integrations.notebook.core.entity.DirectImport
import edu.cdl.iot.integrations.notebook.core.factory.SensorDataFactory
import edu.cdl.iot.integrations.notebook.core.repository.NotebookProjectRepository
import org.scalatest.BeforeAndAfterAll
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should
//import edu.cdl.iot.data.kafka.KafkaRepository

import java.io.{File, FileInputStream}

class DirectImportTests extends AnyFlatSpec with should.Matchers with BeforeAndAfterAll {

  // get a schema.ymal file
  val schemaDirectory = s"${System.getProperty("user.dir")}/common/src/main/resources/schema"
  val schemaFileName = s"$schemaDirectory/demo.yaml"
  val input = new FileInputStream(new File(schemaFileName))
  val schema = SchemaFactory.parse(input)
  val sensorDataFactory = new SensorDataFactory(schema)
  val data = new DirectImport("1,2,timestamp,1.0,2.0,3.0")
  val sensorData = sensorDataFactory.fromCsv(data.getData)
  //val kafkaRepository = new KafkaRepository
  //kafkaRepository.send(kafkaRepository.topics.data, sensorData.toByteArray)
  //sensorDataRepository.createSensorData(sensorData)

  "DirectImport" should "Return the same input string" in {
    data.getData should be ("1,2,timestamp,1.0,2.0,3.0")
  }

  // SensorData(b6ee5bab-08dd-49b0-98b6-45cd0a28b12f,2,timestamp,
  // Map(temperature -> 1.0, pressure -> 2.0, wind -> 3.0),Map(),Map(),Map(),Map(),Map())
  "fromCsv" should "Return the same input string" in {
    sensorData should not be null
  }

}


