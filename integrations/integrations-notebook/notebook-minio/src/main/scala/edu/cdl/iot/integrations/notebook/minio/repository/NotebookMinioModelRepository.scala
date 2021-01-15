package edu.cdl.iot.integrations.notebook.minio.repository

import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.data.minio.repository.MinioModelRepository
import edu.cdl.iot.integrations.notebook.core.repository.NotebookModelFileRepository

class NotebookMinioModelRepository(minioRepository: MinioRepository)
  extends MinioModelRepository(minioRepository) with NotebookModelFileRepository
