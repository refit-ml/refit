lazy val `demo-cassandra` = project in file("../../demo/demo-cassandra")
lazy val `demo-core` = project in file("../../demo/demo-core")

name := "demo-application"
Settings.default
baseAssemblySettings
Settings.assembly

libraryDependencies ++= Dependencies.camel
assemblyJarName in assembly := "demo.jar"
mainClass in (run / assembly) := Some("edu.cdl.iot.demo.application.CamelMain")

dependsOn(
  `demo-core`,
  `demo-cassandra`,
  Shared.protocol
)
