package edu.cdl.iot.data.cassandra


import java.net.InetSocketAddress

import com.datastax.oss.driver.api.core.CqlSession
import com.datastax.oss.driver.api.core.cql.{PreparedStatement, ResultSet, Statement}
import edu.cdl.iot.common.yaml.CassandraConfig


class CassandraRepository(private val config: CassandraConfig) {

  val keyspace: String = config.keyspace


  private var session: CqlSession = CqlSession.builder()
    .addContactPoint(InetSocketAddress.createUnresolved(config.host, config.port))
    .withAuthCredentials(config.user, config.password)
    .withLocalDatacenter("datacenter1")
    .build()


  def close(): Unit = {
    session.close()
    session = null
  }

  def prepare(query: String): PreparedStatement = session.prepare(query)

  def execute(statement: Statement[_]): ResultSet = session.execute(statement)

}
