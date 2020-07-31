package edu.cdl.iot.training.load

import edu.cdl.iot.training.dto.OperableDataDto
import org.apache.spark.sql.{Encoders, SparkSession}

object TrainingWindow {
  def load(session: SparkSession) = session
    .read
    .format("org.apache.spark.sql.cassandra")
    .options(Map("table" -> "training_window", "keyspace" -> "cdl_refit"))
    .load()
    .select("project_guid", "sensor_id", "start", "end")

  (Encoders.product[OperableDataDto])
}
