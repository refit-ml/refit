package edu.cdl.iot.ingestion.dao

import com.datastax.driver.core.{Cluster, HostDistance, PoolingOptions, PreparedStatement, Session}

import collection.JavaConverters._

object ModelDao {
  val host = "127.0.0.1"
  val keyspace = "cdl_refit"
  val user = "cassandra"
  val password = "cassandra"
  val port = 9042

  lazy val poolingOptions: PoolingOptions = {
    new PoolingOptions()
      .setConnectionsPerHost(HostDistance.LOCAL, 4, 10)
      .setConnectionsPerHost(HostDistance.REMOTE, 2, 4)
  }

  lazy val cluster: Cluster = {
    val builder = Cluster.builder()
    builder.addContactPoint(host)
    builder.withCredentials(user, password)
    builder.withPort(port)
    builder.build()
  }

  var session: Session = cluster.connect()

  object queries {
    val getModel: String =
      s"""
         |SELECT model
         |FROM $keyspace.models
         |WHERE project_guid = ?
         |AND model_guid = ?
         |""".stripMargin
  }

  object statements  {
    lazy val getModel: PreparedStatement = session.prepare(queries.getModel)
  }

  def getModel(projectGuid: String, modelGuid: String): Array[Byte] =
    session.execute(statements.getModel.bind(projectGuid, modelGuid))
    .all
    .asScala
    .head
    .getBytes("model").array()




}