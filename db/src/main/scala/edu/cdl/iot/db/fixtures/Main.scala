package edu.cdl.iot.db.fixtures

import java.io.{File, FileInputStream}

import edu.cdl.iot.common.schema.SchemaFactory
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.db.fixtures.`import`.{SensorDataImport, TrainingWindowImport}
import org.apache.spark.SparkConf
import org.apache.spark.sql.SparkSession

object Main {
  def main(args: Array[String]): Unit = {

    val cassandraHost = "127.0.0.1"
    val cassandraUsername = "cassandra"
    val cassandraPassword = "cassandra"
    val cassandraKeyspace = "cdl_refit"
    val encryptionKey = "keyboard_cat"
    val schemaName = "baxter"
    val schemaFile = s"${System.getProperty("user.dir")}/db/data/schema/${schemaName}.yaml"
    val schema = SchemaFactory.parse(new FileInputStream(new File(schemaFile)))
    val encryptionHelper = new EncryptionHelper(encryptionKey, schema.projectGuid.toString)
    val loadTrainingWindow = false
    val loadSensorData = true


    println("Create schema fixtures ...")
    Fixtures.build(cassandraHost, cassandraUsername, cassandraPassword, cassandraKeyspace)

    if (loadTrainingWindow || loadSensorData) {
      val conf = new SparkConf()
        .setAppName("baselineModel")
        .set("spark.cassandra.connection.host", cassandraHost)
        .set("spark.cassandra.auth.username", cassandraUsername)
        .set("spark.cassandra.auth.password", cassandraPassword)
        .setMaster("local[2]")
      val session = SparkSession.builder.config(conf).getOrCreate()
      session.sparkContext.setLogLevel("ERROR")


      if (loadSensorData) {
        println("Importing Sensor Data")
        val data = SensorDataImport.load(session, schema, encryptionHelper)
        data.show(5)
        println("Saving Sensor Data")
        SensorDataImport.save(data)
      }

      if (loadTrainingWindow) {
        println("Importing training window data")
        val data = TrainingWindowImport.load(session, schema)
        data.show(5)
        println("Saving training window data")
        TrainingWindowImport.save(data)
      }
    }
  }
}
