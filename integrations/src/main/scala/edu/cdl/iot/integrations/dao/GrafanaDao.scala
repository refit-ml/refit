package edu.cdl.iot.integrations.dao

import java.text.SimpleDateFormat

import com.datastax.driver.core.{PreparedStatement, ResultSet, Row}
import edu.cdl.iot.integrations.dao.queries.GrafanaQueries
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.yaml.CassandraConfig
import edu.cdl.iot.dao.RefitDao

import collection.JavaConverters._

class GrafanaDao(private val config: CassandraConfig) extends RefitDao(config) {

  private val queries = GrafanaQueries(config.keyspace)

  object statements {
    lazy val getAllSensors: PreparedStatement = session.prepare(queries.getAllSensors)
    lazy val getSensors: PreparedStatement = session.prepare(queries.getSensors)
    lazy val getSensorData: PreparedStatement = session.prepare(queries.getSensorData)
    lazy val getProjects: PreparedStatement = session.prepare(queries.getProjects)
    lazy val getOrgs: PreparedStatement = session.prepare(queries.getOrgs)
  }

  def getSensorData: ResultSet = session.execute(statements.getSensorData.bind())

  def getProjects: List[String] =
    session.execute(statements.getProjects.bind())
      .all()
      .asScala
      .map(x => s"${x.get("name", classOf[String])} - ${x.get("project_guid", classOf[String])}")
      .toList

  def getOrgs: List[String] =
    session.execute(statements.getOrgs.bind())
      .all
      .asScala
      .map(x => s"${x.get("name", classOf[String])} - ${x.get("org_guid", classOf[String])}")
      .toList


  def getAllSensors: List[String] =
    session.execute(statements.getAllSensors.bind())
      .all()
      .asScala
      .map(x => x.get("sensor_id", classOf[String]))
      .toList

  def getSensors(projectGuid: String): List[String] =
    session.execute(statements.getSensors.bind(projectGuid))
      .all()
      .asScala
      .map(x => x.get("sensor_id", classOf[String]))
      .toList


  def getSensorData(projectGuid: String,
                    sensorId: String,
                    partition: String): List[Row] =
    session.execute(
      statements.getSensorData.bind(
        projectGuid,
        sensorId,
        partition))
      .all()
      .asScala
      .toList


  def getSensorData(decryptionHelper: String => EncryptionHelper,
                    projectGuid: String,
                    sensorId: String,
                    partitions: List[String]): List[Map[String, String]] =
    partitions.flatMap(partition => getSensorData(projectGuid, sensorId, partition))
      .map(row => {
        val helper = decryptionHelper(projectGuid)
        val formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        val timestamp = formatter.format(row.getTimestamp("timestamp"))
        val data = helper.transform(row.getMap("data", classOf[String], classOf[String]).asScala.toMap)
        val predictions = helper.transform(row.getMap("prediction", classOf[String], classOf[String]).asScala.toMap)
          .map(x => s"prediction - ${x._1}" -> x._2)
        val labels = helper.transform(row.getMap("labels", classOf[String], classOf[String]).asScala.toMap)
          .map(x => s"actual - ${x._1}" -> x._2)

        Map(
          "sensorid" -> sensorId,
          "timestamp" -> timestamp
        ) ++ predictions ++ labels ++ data
      })

}
