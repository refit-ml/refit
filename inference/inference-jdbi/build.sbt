lazy val `inference-core` = project in file("../inference-core")
name := "inference-jdbi"

Settings.default
libraryDependencies ++= Dependencies.jackson
libraryDependencies ++= Dependencies.jdbi

fork in Test := true


dependsOn(
  `inference-core`,
  Shared.`data-postgres`,
  Shared.common
)