lazy val `notebook-cassandra` = project in file("../notebook-cassandra")
lazy val `notebook-kafka` = project in file("../notebook-kafka")
lazy val `notebook-minio` = project in file("../notebook-minio")
lazy val `notebook-core` = project in file("../notebook-core")

name := "notebook-camel"
Settings.default

libraryDependencies ++= Dependencies.camel

dependsOn(
  `notebook-core`,
  `notebook-cassandra`,
  `notebook-kafka`,
  `notebook-minio`,
  Shared.protocol
)
