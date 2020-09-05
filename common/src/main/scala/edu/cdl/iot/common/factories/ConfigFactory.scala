package edu.cdl.iot.common.factories

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.config.implementation.{EnvironmentConfig, ResourceConfig}
import edu.cdl.iot.common.constants.EnvConstants


class ConfigFactory(private val useEnvironment: Boolean = sys.env.contains(EnvConstants.PROJECT)) {
  def getConfig: RefitConfig =
    if (useEnvironment) new EnvironmentConfig()
    else new ResourceConfig()

}
