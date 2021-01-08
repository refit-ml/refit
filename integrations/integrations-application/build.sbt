lazy val `integrations-cassandra` = project in file("../integrations-cassandra")
lazy val `integrations-core` = project in file("../integrations-core")

name := "integrations-application"
Settings.assembly

libraryDependencies ++= Dependencies.camel
assemblyJarName in assembly := "integrations.jar"
mainClass in (run / assembly) := Some("edu.cdl.iot.ingestion.application.CamelMain")

dependsOn(
  `integrations-core`,
  `integrations-cassandra`,
  Shared.protocol
)
