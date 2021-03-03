package edu.cdl.iot.data.cassandra

import java.sql.Timestamp
import java.util.UUID

import edu.cdl.iot.common.domain.Sensor
import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.data.cassandra.repository.CassandraSensorRepository
import org.scalatest.flatspec.AnyFlatSpec
import java.time.Instant

class CassandraSensorRepositoryTest extends AnyFlatSpec {
  private val config = new ConfigFactory(useEnvironment = false).getConfig
  private val cassandraConfig = config.getCassandraConfig()
  private val cassandraRepository = new CassandraRepository(cassandraConfig)

  private val repository = new CassandraSensorRepository(cassandraRepository)

  private def randomSensor = Sensor(
    projectGuid = UUID.randomUUID().toString,
    sensorId = "X_1.mat",
    createdAt = Timestamp.from(Instant.now())
  )

  "Sensor Repository" should "Be able to save" in {
    val sensor = randomSensor
    repository.save(Seq(
      sensor
    ))

    val sensors = repository.findAll(sensor.projectGuid)
    assert(sensors === List(sensor.sensorId))
  }

}
