package edu.cdl.iot.data.cassandra

import java.util.UUID

import edu.cdl.iot.common.domain.Organization
import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.data.cassandra.repository.CassandraOrganizationRepository
import org.scalatest.flatspec.AnyFlatSpec
import java.sql.Timestamp
import java.time.LocalDateTime

import org.scalatest.matchers.should.Matchers.convertToAnyShouldWrapper

class CassandraOrganizationRepositoryTest extends AnyFlatSpec {
  private val cassandraConfig = new ConfigFactory(useEnvironment = false)
    .getConfig
    .getCassandraConfig()
  private val cassandraRepository = new CassandraRepository(cassandraConfig)
  private val organizationRepository = new CassandraOrganizationRepository(cassandraRepository)

  private def randomOrganization = Organization(
    orgGuid = UUID.randomUUID(),
    timestamp = Timestamp.valueOf(LocalDateTime.now()),
    name = s"foo-bar-${UUID.randomUUID().toString}"
  )

  "Organization Repository" should "Be able to save" in {
    val organization = randomOrganization
    organizationRepository.save(organization)

  }

  "Organization Repository" should "Be able to fetch after saving" in {
    val expected = randomOrganization
    organizationRepository.save(expected)
    val actual = organizationRepository
      .findAll
      .filter(x => x == s"${expected.name} - ${expected.orgGuid.toString}")

    actual.nonEmpty shouldBe true

  }

}
