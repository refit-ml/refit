package edu.cdl.iot.prediction.camel.dependencies

import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.yaml.KafkaConfig
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.prediction.camel.routes.PredictionRoutes
import edu.cdl.iot.prediction.cassandra.repository.{PredictionCassandraProjectRepository, PredictionCassandraSensorDataRepository, PredictionCassandraSensorRepository}
import edu.cdl.iot.prediction.core.service.PredictionService
import org.apache.camel.CamelContext

class PredictionDependencies(kafkaConfig: KafkaConfig,
                             cassandraRepository: CassandraRepository,
                             camelContext: CamelContext,
                             encryptionHelperProvider: String => EncryptionHelper) {

  private val projectRepository = new PredictionCassandraProjectRepository(cassandraRepository)
  private val sensorRepository = new PredictionCassandraSensorRepository(cassandraRepository)
  private val sensorDataRepository = new PredictionCassandraSensorDataRepository(cassandraRepository)

  private val predictionSerice = new PredictionService(
    projectRepository = projectRepository,
    sensorRepository = sensorRepository,
    predictionRepository = sensorDataRepository,
    encryptionHelperProvider = encryptionHelperProvider
  )

  val predictionRoutes = new PredictionRoutes(
    context = camelContext,
    kafkaConfig = kafkaConfig,
    predictionService = predictionSerice
  )
}
