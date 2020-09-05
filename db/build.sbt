lazy val db = (project in file("."))
  .settings(
    Settings.default,
    libraryDependencies ++= Dependencies.pulsarDependencies,
    libraryDependencies += Libraries.cassandra,
    excludeDependencies ++= Seq(
      ExclusionRule("org.slf4j", "slf4j-log4j12")
    ),
    mainClass in run := Some("edu.cdl.iot.db.fixtures.Main"),
    assembly := null
  ).dependsOn(Shared.protocol, Shared.common, Shared.dao)