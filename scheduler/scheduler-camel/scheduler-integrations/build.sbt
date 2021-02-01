lazy val `scheduler-jdbi` = project in file("../../scheduler-jdbi")
lazy val `scheduler-core` = project in file("../../scheduler-core")
lazy val `scheduler-kube` = project in file("../../scheduler-kube")
lazy val `scheduler-kafka` = project in file("../../scheduler-kafka")
name := "scheduler-integrations"

Settings.default

libraryDependencies ++= Dependencies.camel

dependsOn(
  `scheduler-core`,
  `scheduler-jdbi`,
  `scheduler-kube`,
  `scheduler-kafka`,
  Shared.protocol
)
