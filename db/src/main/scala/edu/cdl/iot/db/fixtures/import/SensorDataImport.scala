package edu.cdl.iot.db.fixtures.`import`

import edu.cdl.iot.db.fixtures.dto.{SensorData, TrainingWindow}
import edu.cdl.iot.db.fixtures.schema.Schema
import org.apache.spark.sql.{Dataset, Encoders, SaveMode, SparkSession}

object SensorDataImport {
  def load(session: SparkSession, schema: Schema): Dataset[SensorData] = session
    .read
    .format("CSV")
    .option("header", schema.includesHeader)
    .load(s"${System.getProperty("user.dir")}/db/data/${schema.name}.csv")
    .map(d => {
      val key = schema.getKey(d)
      val timestampParts  = schema.getTimestamp(d).split("\t")
      val timestamp = timestampParts(0)
      val features = schema.getFeatures(d)
      val labels = schema.getLabels(d)
      SensorData(
        schema.projectGuid.toString,
        key,
        key,
        timestamp,
        features,
        labels
      )
    })(Encoders.product[SensorData])


  def save(dataSet: Dataset[SensorData]): Unit = dataSet
    .write.format("org.apache.spark.sql.cassandra")
    .options(
      Map(
        "keyspace" -> "cdl_refit",
        "table" -> "sensor_data")
    )
    .mode(SaveMode.Append)
    .save

}
