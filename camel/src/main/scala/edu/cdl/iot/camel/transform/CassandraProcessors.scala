package edu.cdl.iot.camel.transform

import java.sql.Timestamp
import java.time.Instant
import java.util.Properties

import edu.cdl.iot.camel.dao.SensorDataDao
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.{Exchange, Processor}
import org.skife.jdbi.v2.DBI

import scala.collection.JavaConverters.mapAsScalaMapConverter
import collection.JavaConverters.mapAsJavaMapConverter

object CassandraProcessors {
  val host = "127.0.0.1"
  val keyspace = "cdl_refit"
  val props = new Properties()
  props.setProperty("user", "cassandra")
  props.setProperty("password", "cassandra")
  val jdbi = new DBI(s"jdbc:cassandra://$host:9160/$keyspace", props)

  def combineSensorReadings(v: Prediction): Map[String, String] = {
    val data: Map[String, String] = v.integers.map({
      case (x, d) =>
        x -> d.toString
    })
      .++(v.doubles.map({
        case (x, d) =>
          x -> d.toString
      }))
      .++(v.strings.map({
        case (x, d) =>
          x -> d
      }))
    // TODO: We need to encrypt this map right HERE
    data
  }

  def mapToString(v: Map[String, String]): String = {
    val res = v.map(x => s"\'${x._1}\': \'${x._2}\'")
    val str = s"{ ${res.mkString(",")} }"
    str
  }

  val sendToCassandra: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn().getBody(classOf[Prediction])
      val handle = jdbi.open()
      try {
        val dataMapString = mapToString(combineSensorReadings(record))
        val predictionMapString = mapToString(record.prediction)


        val dao = handle.attach(classOf[SensorDataDao])
        dao.createSensorData(
          record.projectGuid,
          record.sensorId,
          record.sensorId,
          Timestamp.from(Instant.now()) // TODO We need to parse the timestamp string HERE
//          combineSensorReadings(record),
//          record.prediction
        )
      }
      finally {
        handle.close()
      }

    }
  }
}
