package edu.cdl.iot.integrations.notebook.minio.repository

import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.data.minio.repository.MinioSchemaRepository
import edu.cdl.iot.integrations.notebook.core.repository.NotebookSchemaRepository

class NotebookMinioSchemaRepository(minioRepository: MinioRepository)
  extends MinioSchemaRepository(minioRepository) with NotebookSchemaRepository
