package edu.cdl.iot.dao

import com.datastax.driver.core.{Cluster, HostDistance, PoolingOptions, QueryOptions, Session}
import edu.cdl.iot.common.yaml.CassandraConfig

class RefitDao(private val config: CassandraConfig) {
  lazy val poolingOptions: PoolingOptions = {
    new PoolingOptions()
      .setConnectionsPerHost(HostDistance.LOCAL, 4, 10)
      .setConnectionsPerHost(HostDistance.REMOTE, 2, 4)
  }

  lazy val cluster: Cluster = {
    val builder = Cluster.builder()
    builder.addContactPoint(config.host)
    builder.withCredentials(config.user, config.password)
    builder.withPort(config.port)
    builder.withQueryOptions(new QueryOptions())
    builder.build()
  }

  var session: Session = cluster.connect()


  def close(): Unit = {
    session.close()
    cluster.close()
    session = null
  }

}
