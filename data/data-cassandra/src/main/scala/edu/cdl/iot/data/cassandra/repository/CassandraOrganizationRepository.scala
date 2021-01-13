package edu.cdl.iot.data.cassandra.repository

import com.datastax.driver.core.PreparedStatement
import edu.cdl.iot.common.domain.Organization
import edu.cdl.iot.data.cassandra.CassandraRepository

import scala.collection.JavaConverters.asScalaBufferConverter

class CassandraOrganizationRepository(cassandraRepository: CassandraRepository) {

  private val keyspace = cassandraRepository.keyspace

  private object Query {
    val createOrg: String =
      s"""
         |INSERT INTO $keyspace.org (org_guid, name, timestamp)
         |VALUES (?, ?, ?)
         |""".stripMargin

    val getOrganizations: String =
      s"""
         |SELECT org_guid, name
         |FROM $keyspace.org
         |""".stripMargin
  }

  private object Statement {
    lazy val createOrg: PreparedStatement = cassandraRepository.prepare(Query.createOrg)
    lazy val getOrganizations: PreparedStatement = cassandraRepository.prepare(Query.getOrganizations)
  }


  def save(organization: Organization): Unit =
    cassandraRepository.execute(Statement.createOrg.bind(
      organization.orgGuid.toString,
      organization.name,
      organization.timestamp
    ))

  def findAll: List[String] =
    cassandraRepository.execute(Statement.getOrganizations.bind())
      .all
      .asScala
      .map(x => s"${x.get("name", classOf[String])} - ${x.get("org_guid", classOf[String])}")
      .toList
}
