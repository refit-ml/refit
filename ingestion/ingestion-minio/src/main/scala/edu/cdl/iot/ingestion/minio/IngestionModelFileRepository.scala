package edu.cdl.iot.ingestion.minio

import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.data.minio.repository.MinioModelRepository
import edu.cdl.iot.ingestion.core.repository.ModelFileRepository

class IngestionModelFileRepository(minioRepository: MinioRepository)
  extends MinioModelRepository(minioRepository) with ModelFileRepository
