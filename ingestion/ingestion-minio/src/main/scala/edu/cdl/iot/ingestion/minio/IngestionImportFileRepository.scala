package edu.cdl.iot.ingestion.minio

import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.data.minio.repository.MinioImportRepository
import edu.cdl.iot.ingestion.core.repository.ImportFileRepository

class IngestionImportFileRepository(minioRepository: MinioRepository)
  extends MinioImportRepository(minioRepository) with ImportFileRepository
