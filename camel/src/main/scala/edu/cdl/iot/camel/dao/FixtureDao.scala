package edu.cdl.iot.camel.fixtures.dao

import java.sql.Timestamp

import org.skife.jdbi.v2.sqlobject.{Bind, SqlUpdate}

trait FixtureDao {

  @SqlUpdate("INSERT INTO sensor_data" +
    "(project_guid, sensor_id, partition_key, timestamp, data, prediction) " +
    "values (:project, :sensorId, :partitionKey, :timestamp, :data, :prediction);")
  def createSensorData(@Bind("project") projectGuid: String,
                       @Bind("sensorId") sensorId: String,
                       @Bind("partitionKey") partitionKey: String,
                       @Bind("timestamp") timestamp: Timestamp,
                       @Bind("data") data: java.util.Map[String, String],
                       @Bind("prediction") prediction: java.util.Map[String, String])
}
