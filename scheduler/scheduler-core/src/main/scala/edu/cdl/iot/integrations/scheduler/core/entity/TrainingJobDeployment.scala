package edu.cdl.iot.integrations.scheduler.core.entity


object TrainingJobDeploymentStatus extends Enumeration {
  type Main = Value

  val PENDING: Value = Value("Pending")
  val RUNNING: Value = Value("Running")
  val SUCCEEDED: Value = Value("Succeeded")
  val FAILED: Value = Value("Failed")
  val UNKNOWN: Value = Value("Unknown")
}

case class TrainingJobDeployment(name: String,
                                 status: TrainingJobDeploymentStatus.Value)
