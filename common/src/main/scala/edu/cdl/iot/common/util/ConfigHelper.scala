package edu.cdl.iot.common.util

object ConfigHelper {
  def env(name: String, default: String): String = if (sys.env.contains(name)) sys.env(name) else default

}
