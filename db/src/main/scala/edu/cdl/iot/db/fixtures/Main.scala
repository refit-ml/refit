package edu.cdl.iot.db.fixtures

import edu.cdl.iot.db.fixtures.`import`.{SensorDataImport, TrainingWindowImport}
import edu.cdl.iot.db.fixtures.schema.definitions.Prototype
import org.apache.spark.SparkConf
import org.apache.spark.sql.SparkSession

object Main {
  def main(args: Array[String]): Unit = {

    val cassandraHost = "127.0.0.1"
    val cassandraUsername = "cassandra"
    val cassandraPassword = "cassandra"
    val cassandraKeyspace = "cdl_refit"
    val loadTrainingWindow = false
    val loadSensorData = false


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

      val schema = Prototype.dummy

      if (loadSensorData) {
        println("Importing Sensor Data")
        val data = SensorDataImport.load(session, schema)
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
