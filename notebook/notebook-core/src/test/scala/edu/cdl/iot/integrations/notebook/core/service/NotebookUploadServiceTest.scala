package edu.cdl.iot.integrations.notebook.core.service

import edu.cdl.iot.common.factories.ConfigFactory
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

class NotebookUploadServiceTest extends AnyFlatSpec with should.Matchers {
  private val config = new ConfigFactory(useEnvironment = false).getConfig
  private val minioConfig = config.getMinioConfig()
  private val minioRepository = new MinioRepository(minioConfig)
}
