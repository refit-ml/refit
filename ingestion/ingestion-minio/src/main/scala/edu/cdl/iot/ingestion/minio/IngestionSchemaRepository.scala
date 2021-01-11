package edu.cdl.iot.ingestion.minio

import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.data.minio.repository.MinioSchemaRepository
import edu.cdl.iot.ingestion.core.repository.SchemaRepository

class IngestionSchemaRepository(minioRepository: MinioRepository)
  extends MinioSchemaRepository(minioRepository) with SchemaRepository
