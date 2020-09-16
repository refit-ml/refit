package edu.cdl.iot.camel.dao

import com.datastax.driver.core.PreparedStatement
import edu.cdl.iot.camel.dao.queries.PredictionQueries
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.util.TimestampHelper
import edu.cdl.iot.common.yaml.CassandraConfig
import edu.cdl.iot.dao.RefitDao
import edu.cdl.iot.protocol.Prediction.Prediction
import org.joda.time.DateTimeZone

import collection.JavaConverters.mapAsJavaMapConverter

class PredictionDao(private val config: CassandraConfig) extends RefitDao(config) {

  private val queries = PredictionQueries(config.keyspace)

  object statements {
    lazy val createSensorData: PreparedStatement = session.prepare(queries.createSensorData)
    lazy val createSensor: PreparedStatement = session.prepare(queries.createSensor)
  }

  def savePrediction(schema: Schema,
                     record: Prediction,
                     data: Map[String, String],
                     predictions: Map[String, String],
                     labels: Map[String, String]): Unit = {
    val date = TimestampHelper.parseDate(record.timestamp).toDateTime(DateTimeZone.UTC)
    val timestamp = TimestampHelper.toTimestamp(date)

    session.execute(statements.createSensorData
      .bind(
        data.asJava,
        predictions.asJava,
        labels.asJava,
        record.projectGuid,
        record.sensorId,
        schema.getPartitionString(date),
        timestamp
      ))
    session.execute(statements.createSensor
      .bind(
        record.projectGuid,
        record.sensorId,
        timestamp
      ))
  }
}
