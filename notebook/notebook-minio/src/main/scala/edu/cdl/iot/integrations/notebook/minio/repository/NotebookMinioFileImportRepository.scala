package edu.cdl.iot.integrations.notebook.minio.repository

import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.data.minio.repository.MinioImportRepository
import edu.cdl.iot.integrations.notebook.core.repository.NotebookImportFileRepository

class NotebookMinioFileImportRepository(minioRepository: MinioRepository)
  extends MinioImportRepository(minioRepository) with NotebookImportFileRepository

