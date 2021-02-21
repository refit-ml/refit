package edu.cdl.iot.ingestion.application.dependencies

import edu.cdl.ingestion.scheduler.camel.dependencies.SchedulerDependencies
import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.data.cassandra.CassandraRepository
import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.ingestion.notebook.camel.dependencies.NotebookDependencies
import org.apache.camel.CamelContext

class IngestionDependencies(config: RefitConfig,
                            context: CamelContext) {

  private val cassandraRepository = new CassandraRepository(config.getCassandraConfig())
  private val kafkaRepository = new KafkaRepository(config.getKafkaConfig(), "ingestion")
  private val minioRepository = new MinioRepository(config.getMinioConfig())

  val notebookDependencies = new NotebookDependencies(
    config = config,
    context = context,
    cassandraRepository = cassandraRepository,
    kafkaRepository = kafkaRepository,
    minioRepository = minioRepository
  )
  val schedulerDependencies = new SchedulerDependencies(
    config = config,
    context = context
  )
}
