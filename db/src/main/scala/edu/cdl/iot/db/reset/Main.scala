package edu.cdl.iot.db.reset

import edu.cdl.iot.db.reset.schema.definitions.Prototype
import org.apache.spark.SparkConf
import org.apache.spark.sql.{Encoders, SparkSession}
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat

case class SensorData(
                       key: String,
                       sensor_id: String,
                       timestamp: String,
                       data: Map[String, String],
                       prediction: Map[String, String]
                     )

case class OperableData(
                         key: String,
                         sensor_id: String,
                         start: String,
                         end: String
                       )

object Main {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("baselineModel")
      .set("spark.cassandra.connection.host", "127.0.0.1")
      .set("spark.cassandra.auth.username", "cassandra")
      .set("spark.cassandra.auth.password", "cassandra")
      .setMaster("local[2]")
    val spark = SparkSession.builder.config(conf).getOrCreate()
    spark.sparkContext.setLogLevel("ERROR")

    val schema = Prototype.dummy

    val file_path = s"${System.getProperty("user.dir")}/db/data/${schema.name}.csv"
    val time_path = s"${System.getProperty("user.dir")}/db/data/time.csv"

    val containsHeader = true
    val data = spark
      .read
      .format("CSV")
      .option("header", containsHeader)
      .load(file_path)
      .map(d => {
        val sensorId = d(1).toString
        val timestamp = DateTime.parse(d(2).toString, DateTimeFormat.forPattern("YYYY-MM-dd HH:mm:ss"))
        val temperature = d(3).toString
        val pressure = d(4).toString
        val wind = d(5).toString
        SensorData(
          s"${sensorId}_${timestamp.toString(DateTimeFormat.forPattern("YYYY-MM-dd HH:mm:ss"))}",
          sensorId,
          timestamp.toDateTimeISO.toString(DateTimeFormat.forPattern("YYYY-MM-dd HH:mm:ss")),
          Map(
            "temperature" -> temperature,
            "wind" -> wind,
            "pressure" -> pressure,
            "hour" -> timestamp.getHourOfDay.toString
          ),
          Map()
        )
      })(Encoders.product[SensorData])

    val time = spark
      .read
      .format("CSV")
      .option("header", "true")
      .load(time_path)
      .map(d =>
        OperableData(
          d(0).toString,
          d(1).toString,
          d(2).toString,
          d(3).toString
        ))(Encoders.product[OperableData])


    data.show(5)
    time.show(5)

    time
      .write.format("org.apache.spark.sql.cassandra")
      .options(
        Map(
          "keyspace" -> "iot_prototype_training",
          "table" -> "in_operable_entry")
      ).save()

    data
      .write.format("org.apache.spark.sql.cassandra")
      .options(
        Map(
          "keyspace" -> "iot_prototype_training",
          "table" -> "sensor_data")
      ).save()

  }
}
