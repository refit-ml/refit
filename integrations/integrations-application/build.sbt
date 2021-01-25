lazy val `notebook-camel` = project in file("../integrations-notebook/notebook-camel")
lazy val `grafana-camel` = project in file("../integrations-grafana/grafana-camel")
lazy val `prediction-camel` = project in file("../integrations-prediction/prediction-camel")
lazy val `scheduler-camel` = project in file("../integrations-scheduler/scheduler-camel")
name := "integrations-application"
Settings.assembly

libraryDependencies ++= Dependencies.camel
libraryDependencies ++= Seq(
  Libraries.camelQuartz,
  Libraries.postgres
)

assemblyJarName in assembly := "integrations.jar"
mainClass in (run / assembly) := Some("edu.cdl.iot.integrations.application.CamelMain")

dependsOn(
  `grafana-camel`,
  `notebook-camel`,
  `prediction-camel`,
  `scheduler-camel`,
  Shared.protocol
)
