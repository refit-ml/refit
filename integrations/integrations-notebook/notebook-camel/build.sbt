lazy val `notebook-cassandra` = project in file("../notebook-cassandra")
lazy val `notebook-core` = project in file("../notebook-core")

name := "notebook-camel"
Settings.default

libraryDependencies ++= Dependencies.camel

dependsOn(
  `notebook-core`,
  `notebook-cassandra`,
  Shared.protocol
)
