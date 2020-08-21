package edu.cdl.iot.camel.dto

import java.sql.{Statement, Timestamp}
//import java.time.Instant

import com.datastax.driver.core.{Cluster, HostDistance, PoolingOptions, Session}
import edu.cdl.iot.camel.dto.TimeSerieFixtures.random
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.{Exchange, Processor}
import org.joda.time.format.DateTimeFormat
import org.joda.time.{DateTime, Duration, Instant}

import scala.collection.mutable

class TableResponse(columns: Array[TableColumn],
                    rows: Array[Array[Any]]) {

  def getColumns: Array[TableColumn] = columns

  def getRows: Array[Array[Any]] = rows

  def getType: String = "table"

}

object TableFixtures {

  val host = "127.0.0.1"
  val keyspace = "cdl_refit"
  val user = "cassandra"
  val password = "cassandra"
  val port = 9042

  lazy val poolingOptions: PoolingOptions = {
    new PoolingOptions()
      .setConnectionsPerHost(HostDistance.LOCAL, 4, 10)
      .setConnectionsPerHost(HostDistance.REMOTE, 2, 4)
  }

  lazy val cluster: Cluster = {
    val builder = Cluster.builder()
    builder.addContactPoint(host)
    builder.withCredentials(user, password)
    builder.withPort(port)
    builder.build()
  }

  lazy implicit val session: Session = cluster.connect()

  lazy val schemaRecSensorData =
    s"""
       |SELECT * FROM $keyspace.sensor_data
    """.stripMargin

  lazy val receiveSensorDataStatement = session.prepare(schemaRecSensorData)

  val recFromCassandra: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      println("Executing the statement")
      val results = session.execute(receiveSensorDataStatement.bind())
      println("Executed the statement")
      println(results)
    }
  }

  val random = new scala.util.Random

  def random(start: Int, end: Int): Int = start + random.nextInt((end - start) + 1)

  def response: TableResponse = {
    val lst = Array.ofDim[Any](100, 2)

    for (x <- 0 to 99) {
      lst(x) = Array(Instant.now().minus(Duration.standardMinutes(10)).getMillis, random(1110, 1115).toString, random(1, 1000))
    }
    new TableResponse(
      Array(
        new TableColumn("Time", "time"),
        new TableColumn("SensorID", "string"),
        new TableColumn("Number", "number")
      ),
      lst

    )
  }
}
