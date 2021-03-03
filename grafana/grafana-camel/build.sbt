lazy val `grafana-cassandra` = project in file("../grafana-cassandra")
lazy val `grafana-core` = project in file("../grafana-core")

name := "grafana-camel"
Settings.default

libraryDependencies ++= Dependencies.camel

dependsOn(
  `grafana-core`,
  `grafana-cassandra`,
  Shared.protocol
)
