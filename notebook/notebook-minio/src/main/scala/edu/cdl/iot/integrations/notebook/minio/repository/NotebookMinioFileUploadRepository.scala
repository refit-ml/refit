package edu.cdl.iot.integrations.notebook.minio.repository

import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.data.minio.repository.MinioFileRepository
import edu.cdl.iot.integrations.notebook.core.repository.NotebookUploadFileRepository


class NotebookMinioFileUploadRepository(minioRepository: MinioRepository)
  extends MinioFileRepository(minioRepository) with NotebookUploadFileRepository

