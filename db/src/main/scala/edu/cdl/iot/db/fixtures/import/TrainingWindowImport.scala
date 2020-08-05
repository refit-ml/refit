package edu.cdl.iot.db.fixtures.`import`

import edu.cdl.iot.db.fixtures.dto.TrainingWindow
import edu.cdl.iot.db.fixtures.schema.Schema
import org.apache.spark.sql.{Dataset, Encoders, SaveMode, SparkSession}

object TrainingWindowImport {
  def load(session: SparkSession, schema: Schema): Dataset[TrainingWindow] = session
    .read
    .format("CSV")
    .option("header", "true")
    .load(s"${System.getProperty("user.dir")}/db/data/${schema.name}-training-window.csv")
    .map(d =>
      TrainingWindow(
        schema.projectGuid.toString,
        d(0).toString,
        d(1).toString,
        d(2).toString,
        d(3).toString
      ))(Encoders.product[TrainingWindow])

  def save(dataSet: Dataset[TrainingWindow]): Unit = dataSet
    .write.format("org.apache.spark.sql.cassandra")
    .options(
      Map(
        "keyspace" -> "cdl_refit",
        "table" -> "training_window")
    )
    .mode(SaveMode.Append)
    .save

}
