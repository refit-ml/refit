package edu.cdl.iot.data.cassandra.repository

import java.sql.Timestamp

import com.datastax.oss.driver.api.core.cql.{BatchStatement, BatchStatementBuilder, BatchType, BoundStatement, PreparedStatement}
import edu.cdl.iot.common.domain.Sensor
import edu.cdl.iot.data.cassandra.CassandraRepository

import scala.collection.JavaConverters.asScalaBufferConverter

class CassandraSensorRepository(cassandraRepository: CassandraRepository) {
  private val keyspace = cassandraRepository.keyspace

  private object Query {
    val createSensor: String =
      s"""
         |INSERT INTO $keyspace.sensor (project_guid, sensor_id, created_at)
         |VALUES (?, ?, ?)
         |""".stripMargin

    val getSensors: String =
      s"""
         |SELECT sensor_id
         |FROM $keyspace.sensor
         |WHERE project_guid = ?
         |""".stripMargin

    val getAllSensors: String =
      s"""
         |SELECT sensor_id
         |FROM $keyspace.sensor
         |""".stripMargin
  }

  private object Statement {
    lazy val createSensor: PreparedStatement = cassandraRepository.prepare(Query.createSensor)
    lazy val getSensors: PreparedStatement = cassandraRepository.prepare(Query.getSensors)
    lazy val getAllSensors: PreparedStatement = cassandraRepository.prepare(Query.getAllSensors)
  }

  private def save(sensor: Sensor): BoundStatement =
    Statement.createSensor.bind(
      sensor.projectGuid,
      sensor.sensorId,
      sensor.createdAt.toInstant
    )

  def save(sensors: Seq[Sensor]): Unit = {
    val batchStatement = new BatchStatementBuilder(BatchType.LOGGED)
    sensors.map(save)
      .foreach(batchStatement.addStatement)
    cassandraRepository.execute(batchStatement.build())
  }

  def findAll(projectGuid: String): List[String] =
    cassandraRepository.execute(Statement.getSensors.bind(projectGuid))
      .all()
      .asScala
      .map(x => x.get("sensor_id", classOf[String]))
      .toList

  def findAll: List[String] = cassandraRepository.execute(Statement.getAllSensors.bind())
    .all()
    .asScala
    .map(x => x.get("sensor_id", classOf[String]))
    .toList
}
