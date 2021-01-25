lazy val `scheduler-core` = project in file("../scheduler-core")
name := "scheduler-jdbi"

Settings.default
libraryDependencies ++= Dependencies.jackson
libraryDependencies ++= Dependencies.jdbi
dependsOn(
  `scheduler-core`,
  Shared.common
)