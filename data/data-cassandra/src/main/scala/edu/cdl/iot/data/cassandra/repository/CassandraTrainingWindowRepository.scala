package edu.cdl.iot.data.cassandra.repository

import java.sql.Timestamp
import java.util.UUID

import com.datastax.oss.driver.api.core.cql.{BatchStatementBuilder, BatchType, BoundStatement, PreparedStatement}
import edu.cdl.iot.common.domain.TrainingWindow
import edu.cdl.iot.data.cassandra.CassandraRepository

import scala.collection.JavaConverters.iterableAsScalaIterableConverter

class CassandraTrainingWindowRepository(cassandraRepository: CassandraRepository) {
  private val keyspace = cassandraRepository.keyspace

  private object Query {
    val createTrainingWindow: String =
      s"""
         |INSERT INTO $keyspace.training_window (project_guid, sensor_id, partition_key, start, end)
         |VALUES (?, ?, ?, ?, ?)
         |""".stripMargin

    val getTrainingWindow: String =
      s"""
         |SELECT project_guid, sensor_id, partition_key, start, end
         |FROM $keyspace.training_window
         |WHERE project_guid = ?
         |AND sensor_id = ?
         |AND partition_key = ?
         |""".stripMargin
  }

  private object Statement {
    lazy val createTrainingWindow: PreparedStatement = cassandraRepository.prepare(Query.createTrainingWindow)
    lazy val getTrainingWindow: PreparedStatement = cassandraRepository.prepare(Query.getTrainingWindow)
  }

  def save(trainingWindow: TrainingWindow): BoundStatement =
    Statement.createTrainingWindow.bind(
      trainingWindow.project_guid,
      trainingWindow.sensor_id,
      trainingWindow.partition_key,
      trainingWindow.start.toInstant,
      trainingWindow.end.toInstant
    )

  def save(records: Seq[TrainingWindow]): Unit = {
    val batchedStatement = new BatchStatementBuilder(BatchType.LOGGED)
    records.map(save)
      .foreach(batchedStatement.addStatement)
    cassandraRepository.execute(batchedStatement.build())
  }

  def find(projectGuid: UUID,
           sensorId: String,
           partitionKey: String): List[TrainingWindow] =
    cassandraRepository.execute(Statement.getTrainingWindow.bind(projectGuid.toString, sensorId, partitionKey))
      .all()
      .asScala
      .map(row => {
        val projectGuid = row.getString("project_guid")
        val sensorId = row.getString("sensor_id")
        val partitionKey = row.getString("partition_key")
        val start = Timestamp.from(row.getInstant("start"))
        val end = Timestamp.from(row.getInstant("end"))

        TrainingWindow(
          projectGuid,
          sensorId,
          partitionKey,
          start,
          end
        )
      })
      .toList

}
