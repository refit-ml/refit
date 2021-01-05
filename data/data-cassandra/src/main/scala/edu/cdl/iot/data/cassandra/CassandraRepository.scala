package edu.cdl.iot.data.cassandra

import java.sql.PreparedStatement

import com.datastax.driver.core
import com.datastax.driver.core.{Cluster, HostDistance, PoolingOptions, QueryOptions, ResultSet, Session, Statement}
import edu.cdl.iot.common.yaml.CassandraConfig


class CassandraRepository(private val config: CassandraConfig) {

  val keyspace: String = config.keyspace

  private lazy val poolingOptions: PoolingOptions = {
    new PoolingOptions()
      .setConnectionsPerHost(HostDistance.LOCAL, 4, 10)
      .setConnectionsPerHost(HostDistance.REMOTE, 2, 4)
  }

  private lazy val cluster: Cluster = {
    val builder = Cluster.builder()
    builder.addContactPoint(config.host)
    builder.withCredentials(config.user, config.password)
    builder.withPort(config.port)
    builder.withQueryOptions(new QueryOptions())
    builder.build()
  }

  private var session: Session = cluster.connect()


  def close(): Unit = {
    session.close()
    cluster.close()
    session = null
  }

  def prepare(query: String): core.PreparedStatement = session.prepare(query)

  def execute(statement: Statement): ResultSet = session.execute(statement)

}
