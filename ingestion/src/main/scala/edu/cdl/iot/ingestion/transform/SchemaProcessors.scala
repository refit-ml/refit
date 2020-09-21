package edu.cdl.iot.ingestion.transform

import java.sql.Timestamp
import java.time.Instant

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.factories.SchemaFactory
import edu.cdl.iot.ingestion.dao.ImportDao
import edu.cdl.iot.ingestion.dto.{Org, Project}
import edu.cdl.iot.ingestion.dto.request.SchemaRequest
import edu.cdl.iot.ingestion.dto.response.ImportResponse
import io.minio.{GetObjectArgs, MinioClient}
import org.apache.camel.{Exchange, Processor}

class SchemaProcessors(config: RefitConfig,
                       importDao: ImportDao) {

  private val minioConfig = config.getMinioConfig()

  private val minioClient = MinioClient.builder
    .endpoint(minioConfig.host)
    .credentials(minioConfig.accessKey, minioConfig.secretKey)
    .build

  val createSchema: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val request = exchange.getIn.getBody(classOf[SchemaRequest])
      val getObjectRequest = GetObjectArgs.builder()
        .bucket(minioConfig.buckets.schema)
        .`object`(request.path)
        .build()
      val schema = SchemaFactory.parse(minioClient.getObject(getObjectRequest))
      val org = Org(
        schema.orgGuid,
        Timestamp.from(Instant.now()),
        schema.org
      )
      val project = Project(
        schema.orgGuid,
        schema.projectGuid,
        schema.name,
        "",
        Timestamp.from(Instant.now()),
        schema)
      importDao.createOrg(org)
      importDao.createProject(project)

      exchange.getIn.setBody(new ImportResponse(true))

    }
  }
}
