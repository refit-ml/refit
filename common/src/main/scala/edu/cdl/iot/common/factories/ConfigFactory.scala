package edu.cdl.iot.common.factories

import java.io.InputStream

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.config.implementation.{EnvironmentConfig, ResourceConfig}
import edu.cdl.iot.common.constants.EnvConstants
import org.slf4j.LoggerFactory


class ConfigFactory(private val useEnvironment: Boolean = sys.env.contains(EnvConstants.PROJECT)) {
  private val logger = LoggerFactory.getLogger(classOf[ConfigFactory])

  private val fileName = "/development.yaml"

  def getConfig: RefitConfig = {
    if (useEnvironment) {
      logger.info("Environment config detected: using environment config")
      new EnvironmentConfig()
    }
    else {
      logger.info("No environment config detected: using file config")
      new ResourceConfig(getClass.getResourceAsStream(fileName))
    }
  }

  def getConfig(input: InputStream) = new ResourceConfig(input)

}
