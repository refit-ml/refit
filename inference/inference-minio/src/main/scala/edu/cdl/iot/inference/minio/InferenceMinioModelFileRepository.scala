package edu.cdl.iot.inference.minio

import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.data.minio.repository.MinioModelRepository

class InferenceMinioModelFileRepository(minioRepository: MinioRepository)
  extends MinioModelRepository(minioRepository)
