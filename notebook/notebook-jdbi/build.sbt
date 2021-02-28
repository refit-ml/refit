lazy val `notebook-core` = project in file("../notebook-core")
name := "notebook-jdbi"

Settings.default
libraryDependencies ++= Dependencies.jackson
libraryDependencies ++= Dependencies.jdbi

fork in Test := true


dependsOn(
  `notebook-core`,
  Shared.`data-postgres`,
  Shared.common
)