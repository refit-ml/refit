package edu.cdl.iot.db.fixtures.`import`

import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.db.fixtures.dto.{SensorData, TrainingWindow}
import org.apache.spark.sql.{Dataset, Encoders, SaveMode, SparkSession}

object SensorDataImport {
  def load(session: SparkSession, schema: Schema, encryptionHelper: EncryptionHelper): Dataset[SensorData] = session
    .read
    .format("CSV")
    .option("header", schema.importOptions.includesHeader)
    .load(s"${System.getProperty("user.dir")}/db/data/import/${schema.getFileName}.csv")
    .map(d => {
      val row = d.toSeq.map(x => x.toString).toArray
      val key = schema.getKey(row)
      val timestampParts = schema.getTimestamp(row).split("\t")
      val timestamp = timestampParts(0)
      val features = schema.getFeatures(row)
      val labels = schema.getLabels(row)
      SensorData(
        schema.projectGuid.toString,
        key,
        key,
        timestamp,
        encryptionHelper.transform(features),
        encryptionHelper.transform(labels)
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
