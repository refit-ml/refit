lazy val `integrations-cassandra` = project in file("../integrations-cassandra")
lazy val `integrations-core` = project in file("../integrations-core")
lazy val `notebook-camel` = project in file("../integrations-notebook/notebook-camel")
lazy val `grafana-camel` = project in file("../integrations-grafana/grafana-camel")
name := "integrations-application"
Settings.assembly

libraryDependencies ++= Dependencies.camel
assemblyJarName in assembly := "integrations.jar"
mainClass in (run / assembly) := Some("edu.cdl.iot.integrations.application.CamelMain")

dependsOn(
  `integrations-core`,
  `integrations-cassandra`,
  `grafana-camel`,
  Shared.protocol
)
