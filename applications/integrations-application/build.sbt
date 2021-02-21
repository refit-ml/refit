lazy val `notebook-integrations` = project in file("../../notebook/notebook-camel/notebook-integrations")
lazy val `grafana-integrations` = project in file("../../grafana/grafana-camel")
lazy val `prediction-integrations` = project in file("../../prediction/prediction-camel")
lazy val `scheduler-integrations` = project in file("../../scheduler/scheduler-camel/scheduler-integrations")
lazy val `static-data-integrations` = project in file("../../static-data/static-data-camel/static-data-integrations")
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
  `static-data-integrations`,
  Shared.protocol
)
