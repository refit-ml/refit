package edu.cdl.iot.db.fixtures.dao

import java.sql.Timestamp

import org.skife.jdbi.v2.sqlobject.{Bind, SqlUpdate}

trait FixtureDao {
  @SqlUpdate("insert into org (org_guid, name, timestamp) VALUES (:guid, :name, :timestamp)")
  def createOrg(@Bind("guid") guid: String,
                @Bind("name") name: String,
                @Bind("timestamp") timestamp: Timestamp)

  @SqlUpdate("insert into project (org_guid, project_guid, name, timestamp) values (:org, :guid, :name, :timestamp);")
  def createProject(@Bind("org") orgGuid: String,
                    @Bind("guid") guid: String,
                    @Bind("name") name: String,
                    @Bind("timestamp") timestamp: Timestamp)

  @SqlUpdate("INSERT INTO sensor_data" +
    "(project_guid, sensor_id, partition_key, timestamp, data, prediction) " +
    "values (:project, :sensorId, :partitionKey, :timestamp, :data, :prediction);")
  def createSensorData(@Bind("project") projectGuid: String,
                       @Bind("sensorId") sensotId: String,
                       @Bind("partitionKey") partitionKey: String,
                       @Bind("timestamp") timestamp: Timestamp,
                       @Bind("data") data: java.util.Map[String, String],
                       @Bind("prediction") prediction: java.util.Map[String, String])
}
