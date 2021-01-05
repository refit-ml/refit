package edu.cdl.iot.data.cassandra.repository

import com.datastax.driver.core.{BatchStatement, BoundStatement, PreparedStatement, ResultSet}
import edu.cdl.iot.common.domain.TrainingWindow
import edu.cdl.iot.data.cassandra.CassandraRepository

class CassandraTrainingWindowRepository(cassandraRepository: CassandraRepository) {
  private val keyspace = cassandraRepository.keyspace

  private object Query {
    val createTrainingWindow: String =
      s"""
         |INSERT INTO $keyspace.training_window (project_guid, sensor_id, partition_key, start, end)
         |VALUES (?, ?, ?, ?, ?)
         |""".stripMargin
  }

  private object Statement {
    lazy val createTrainingWindow: PreparedStatement = cassandraRepository.prepare(Query.createTrainingWindow)
  }

  def createTrainingWindow(trainingWindow: TrainingWindow): BoundStatement =
    Statement.createTrainingWindow.bind(
      trainingWindow.project_guid,
      trainingWindow.sensor_id,
      trainingWindow.partition_key,
      trainingWindow.start,
      trainingWindow.end
    )

  def createTrainingWindow(records: Seq[TrainingWindow]): Unit = {
    val batchedStatement = new BatchStatement()
    records.map(createTrainingWindow)
      .foreach(batchedStatement.add)
    cassandraRepository.execute(batchedStatement)
  }
}
