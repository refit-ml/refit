package edu.cdl.iot.common.security

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.common.yaml.CassandraConfig
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

class ConfigTests extends AnyFlatSpec with should.Matchers {

  "Config" should "Load locally" in {
    val expected = new CassandraConfig("cdl_refit", "127.0.0.1", 9042, "cassandra", "cassandra")
    val factory = new ConfigFactory(false)
    val config = factory.getConfig

    val actual = config.getCassandraConfig()

    actual.host should be(expected.host)
    actual.keyspace should be(expected.keyspace)
    actual.port should be(expected.port)
    actual.user should be(expected.user)
    actual.password should be(expected.password)
  }
}
