package edu.cdl.iot.notebook.jdbi.repository

import java.time.Instant
import java.util.UUID

import edu.cdl.iot.common.domain.StaticData
import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.common.schema.DataSource
import edu.cdl.iot.common.yaml.DataSourceYaml
import edu.cdl.iot.notebook.jdbi.dependencies.NotebookJdbiDependencies
import org.scalatest.BeforeAndAfterEach
import org.scalatest.flatspec.AnyFlatSpec

import scala.collection.JavaConverters.seqAsJavaListConverter

class JdbiStaticDataRepositoryTests extends AnyFlatSpec with BeforeAndAfterEach {
  private val refitConfig = new ConfigFactory(useEnvironment = false).getConfig
  private val postgresConfig = refitConfig.getPostgresConfig()

  private val dependencies = new NotebookJdbiDependencies(postgresConfig)
  private val dataSourceRepository = dependencies.dataSourceRepository
  private val staticDataRepository = dependencies.staticDataRepository

  private var dataSource: DataSource = _
  private var projectGuid: UUID = _
  private var staticData: StaticData = _


  override def beforeEach(): Unit = {
    projectGuid = UUID.randomUUID()
    dataSource = DataSource(new DataSourceYaml(UUID.randomUUID().toString, List().asJava))
    staticData = StaticData(
      projectGuid = projectGuid,
      key = UUID.randomUUID().toString,
      createdAt = Instant.ofEpochMilli(10000),
      doubles = Map("asdf" -> 10.0),
      strings = Map("foo" -> "bar"),
      integers = Map("x" -> 0),
      timestamps = Map("audited_at" -> Instant.ofEpochMilli(100000))
    )
    dataSourceRepository.save(projectGuid, dataSource)
  }

  override def afterEach(): Unit = {
//    dataSourceRepository.delete(projectGuid, dataSource)
  }


  "static data" should "be able to save" in {
    val result = staticDataRepository.save(projectGuid, dataSource, staticData)

    assert(result.isLeft)
  }

  "static data" should "be able to be retrieved" in {
    staticDataRepository.save(projectGuid, dataSource, staticData)
    val actual = staticDataRepository.find(projectGuid, dataSource, staticData.key).left.get
    val expected = staticData.copy(createdAt = actual.createdAt, timestamps = actual.timestamps)
    assert(actual === expected)
  }

}
