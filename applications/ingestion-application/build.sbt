lazy val `scheduler-ingestion` = project in file("../../scheduler/scheduler-camel/scheduler-ingestion")
lazy val `notebook-ingestion` = project in file("../../notebook/notebook-camel/notebook-ingestion")

name := "ingestion-application"
Settings.assembly

libraryDependencies ++= Dependencies.camel
assemblyJarName in assembly := "ingestion.jar"
mainClass in (run / assembly) := Some("edu.cdl.iot.ingestion.application.CamelMain")

dependsOn(
  `notebook-ingestion`,
  `scheduler-ingestion`,
  Shared.protocol
)
