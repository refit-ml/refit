lazy val `notebook-cassandra` = project in file("../../notebook-cassandra")
lazy val `notebook-kafka` = project in file("../../notebook-kafka")
lazy val `notebook-minio` = project in file("../../notebook-minio")
lazy val `notebook-core` = project in file("../../notebook-core")
lazy val `notebook-jdbi` = project in file("../../notebook-jdbi")

name := "notebook-integrations"
Settings.default

libraryDependencies ++= Dependencies.camel

dependsOn(
  `notebook-core`,
  `notebook-cassandra`,
  `notebook-kafka`,
  `notebook-minio`,
  `notebook-jdbi`,
  Shared.protocol
)
