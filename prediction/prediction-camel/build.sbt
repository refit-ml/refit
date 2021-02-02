lazy val `prediction-cassandra` = project in file("../prediction-cassandra")
lazy val `prediction-core` = project in file("../prediction-core")

name := "prediction-camel"
Settings.default

libraryDependencies ++= Dependencies.camel

dependsOn(
  `prediction-core`,
  `prediction-cassandra`,
  Shared.protocol
)
