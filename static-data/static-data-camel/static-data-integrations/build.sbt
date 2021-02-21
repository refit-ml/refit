lazy val `static-data-core` = project in file("../../static-data-core")
name := "static-data-integrations"

Settings.default

libraryDependencies ++= Dependencies.camel

dependsOn(
  `static-data-core`,
  Shared.protocol
)
