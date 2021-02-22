package edu.cdl.iot.notebook.jdbi.repository

import java.util.UUID

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.common.schema.DataSource
import edu.cdl.iot.common.yaml.DataSourceYaml
import edu.cdl.iot.notebook.jdbi.dependencies.NotebookJdbiDependencies
import org.scalatest.BeforeAndAfterEach
import org.scalatest.flatspec.AnyFlatSpec

import scala.collection.JavaConverters.seqAsJavaListConverter

class JdbiDataSourceRepositoryTests extends AnyFlatSpec with BeforeAndAfterEach {

  private val refitConfig = new ConfigFactory(useEnvironment = false).getConfig
  private val postgresConfig = refitConfig.getPostgresConfig()

  private val repository = new NotebookJdbiDependencies(postgresConfig).dataSourceRepository
  private var dataSource: DataSource = _
  private var projectGuid: UUID = _


  override def beforeEach(): Unit = {
    projectGuid = UUID.randomUUID()
    dataSource = DataSource(new DataSourceYaml(UUID.randomUUID().toString, List().asJava))
  }

  override def afterEach(): Unit = {
    repository.delete(projectGuid, dataSource)
  }


  "Data source repository" should "Be able to create a data source" in {
    val result = repository.save(projectGuid, dataSource)
    assert(result.isLeft)
  }

  "Data source repository" should "Be able to be deleted" in {
    val result = repository.save(projectGuid, dataSource)
    repository.delete(projectGuid, dataSource)
    assert(result.isLeft)
  }


}
