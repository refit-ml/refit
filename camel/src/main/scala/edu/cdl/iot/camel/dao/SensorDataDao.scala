package edu.cdl.iot.camel.dao

import java.sql.Timestamp

import org.skife.jdbi.v2.sqlobject.{Bind, SqlUpdate}

trait SensorDataDao {

  @SqlUpdate("INSERT INTO sensor_data" +
    "(project_guid, sensor_id, partition_key, timestamp) " +
    "values (:project, :sensorId, :partitionKey, :timestamp);")
  def createSensorData(@Bind("project") projectGuid: String,
                       @Bind("sensorId") sensorId: String,
                       @Bind("partitionKey") partitionKey: String,
                       @Bind("timestamp") timestamp: Timestamp)
}
