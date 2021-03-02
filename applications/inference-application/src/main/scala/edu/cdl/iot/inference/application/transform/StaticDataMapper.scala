package edu.cdl.iot.inference.application.transform


import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.data.postgres.factory.JdbiFactory
import edu.cdl.iot.inference.jdbi.repository.InferenceJdbiStaticDataRepository
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.common.functions.MapFunction
import org.slf4j.LoggerFactory
import java.util.UUID

import com.github.blemale.scaffeine.{LoadingCache, Scaffeine}
import edu.cdl.iot.common.domain.StaticData
import edu.cdl.iot.common.schema.DataSource
import edu.cdl.iot.common.yaml.DataSourceYaml

import scala.collection.JavaConverters.seqAsJavaListConverter
import scala.concurrent.duration.DurationInt

class StaticDataMapper extends MapFunction[SensorData, SensorData] {
  private lazy val logger = LoggerFactory.getLogger(classOf[EvaluationProcessor])

  private lazy val loadingCache: LoadingCache[(UUID, DataSource, String), StaticData] = {
    Scaffeine()
      .recordStats()
      .expireAfterWrite(1.hour)
      .maximumSize(1000)
      .build((params: (UUID, DataSource, String)) =>
        staticDataRepository.find(params._1, params._2, params._3)
      )
  }

  private lazy val staticDataRepository = {
    logger.info("Initialize static data repository")
    val postgresConfig = new ConfigFactory().getConfig.getPostgresConfig()
    val jdbi = new JdbiFactory(postgresConfig).jdbi
    new InferenceJdbiStaticDataRepository(jdbi)
  }

  override def map(value: SensorData): SensorData =
    value.dataSources.foldLeft(value) { (total: SensorData, current: (String, String)) => {
      val projectGuid = UUID.fromString(value.projectGuid)
      val dataSource = DataSource(new DataSourceYaml(current._1, List().asJava))
      val staticData = loadingCache.get((projectGuid, dataSource, current._2))

      if (staticData == null) total
      else {
        value.copy(
          doubles = total.doubles ++ staticData.doubles,
          strings = total.strings ++ staticData.strings,
          integers = total.integers ++ staticData.integers
        )
      }
    }
    }


}