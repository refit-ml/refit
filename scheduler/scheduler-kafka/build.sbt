lazy val `scheduler-core` = project in file("../scheduler-core")
name := "scheduler-kafka"

Settings.default

dependsOn(
  `scheduler-core`,
  Shared.protocol,
  Shared.`data-kafka`,
  Shared.common
)