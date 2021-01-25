lazy val `scheduler-jdbi` = project in file("../scheduler-jdbi")
lazy val `scheduler-core` = project in file("../scheduler-core")

name := "scheduler-camel"

Settings.default

libraryDependencies ++= Dependencies.camel
libraryDependencies ++= Seq(
  Libraries.camelQuartz,
  Libraries.postgres
)

dependsOn(
  `scheduler-core`,
  `scheduler-jdbi`,
  Shared.protocol
)
