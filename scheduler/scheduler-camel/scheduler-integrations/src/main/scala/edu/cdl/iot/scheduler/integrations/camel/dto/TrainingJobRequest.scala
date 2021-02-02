package edu.cdl.iot.scheduler.integrations.camel.dto

import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@JsonIgnoreProperties(ignoreUnknown = true)
class TrainingJobRequest(var cronExpression: String) {
  def this() = this(null)

  def getCronExpression: String = cronExpression
}
