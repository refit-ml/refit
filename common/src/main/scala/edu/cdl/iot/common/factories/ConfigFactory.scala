package edu.cdl.iot.common.factories

import java.io.InputStream

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.config.implementation.{EnvironmentConfig, ResourceConfig}
import edu.cdl.iot.common.constants.EnvConstants


class ConfigFactory(private val useEnvironment: Boolean = sys.env.contains(EnvConstants.PROJECT)) {
  private val fileName = "/development.yaml"

  def getConfig: RefitConfig =
    if (useEnvironment) new EnvironmentConfig()
    else new ResourceConfig(getClass.getResourceAsStream(fileName))

  def getConfig(input: InputStream) = new ResourceConfig(input)

}
