package edu.cdl.iot.data.cassandra

import java.sql.Timestamp
import java.time.LocalDateTime
import java.util.UUID

import edu.cdl.iot.common.domain.SensorData
import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.data.cassandra.repository.CassandraSensorDataRepository
import javax.crypto.Cipher
import org.scalatest.flatspec.AnyFlatSpec

class CassandraSensorDataRepositoryTest extends AnyFlatSpec {
  private val config = new ConfigFactory(useEnvironment = false).getConfig
  private val cassandraConfig = config.getCassandraConfig()
  private val cassandraRepository = new CassandraRepository(cassandraConfig)

  private val encryptionHelper = new EncryptionHelper(
    key = config.getEncryptionKey(),
    salt = "foo",
    mode = Cipher.ENCRYPT_MODE
  )

  private val decryptionHelper = new EncryptionHelper(
    key = config.getEncryptionKey(),
    salt = "foo",
    mode = Cipher.DECRYPT_MODE
  )

  private val sensorDataRepository = new CassandraSensorDataRepository(cassandraRepository,
    (projectGuid: String) => decryptionHelper
  )

  private def randomSensorData = SensorData(
    project_guid = UUID.randomUUID().toString,
    timestamp = Timestamp.valueOf(LocalDateTime.now()),
    sensor_id = s"foo-bar-${UUID.randomUUID().toString}",
    partition_key = s"foo-partition-${UUID.randomUUID().toString}",
    data = Map("Foo" -> "Bar"),
    prediction = Map("Bar" -> "Foo")
  )

  "SensorData Repository" should "Be able to save" in {
    val sensorData = randomSensorData
    val expected = sensorData.copy(
      data = encryptionHelper.transform(sensorData.data),
      prediction = encryptionHelper.transform(sensorData.prediction)
    )
    sensorDataRepository.save(Seq(expected))

  }

  "SensorData Repository" should "Be able to fetch after saving" in {
    val sensorData = randomSensorData

    val expected = sensorData.copy(
      data = encryptionHelper.transform(sensorData.data),
      prediction = encryptionHelper.transform(sensorData.prediction)
    )
    sensorDataRepository.save(Seq(expected))

    val actual = sensorDataRepository.find(
      projectGuid = expected.project_guid,
      sensorId = expected.sensor_id,
      partitions = List(expected.partition_key)
    )

    assert(actual.nonEmpty)

  }

}
