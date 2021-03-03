lazy val `notebook-integrations` = project in file("../../notebook/notebook-camel/notebook-integrations")
lazy val `grafana-integrations` = project in file("../../grafana/grafana-camel")
lazy val `prediction-integrations` = project in file("../../prediction/prediction-camel")
lazy val `scheduler-integrations` = project in file("../../scheduler/scheduler-camel/scheduler-integrations")
name := "integrations-application"
Settings.assembly

libraryDependencies ++= Dependencies.camel

assemblyJarName in assembly := "integrations.jar"
mainClass in (run / assembly) := Some("edu.cdl.iot.integrations.application.CamelMain")

dependsOn(
  `grafana-integrations`,
  `notebook-integrations`,
  `prediction-integrations`,
  `scheduler-integrations`,
  Shared.protocol
)
