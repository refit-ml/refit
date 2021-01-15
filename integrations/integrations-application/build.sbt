lazy val `notebook-camel` = project in file("../integrations-notebook/notebook-camel")
lazy val `grafana-camel` = project in file("../integrations-grafana/grafana-camel")
lazy val `prediction-camel` = project in file("../integrations-prediction/prediction-camel")
name := "integrations-application"
Settings.assembly

libraryDependencies ++= Dependencies.camel
assemblyJarName in assembly := "integrations.jar"
mainClass in (run / assembly) := Some("edu.cdl.iot.integrations.application.CamelMain")

dependsOn(
  `grafana-camel`,
  `notebook-camel`,
  `prediction-camel`,
  Shared.protocol
)
