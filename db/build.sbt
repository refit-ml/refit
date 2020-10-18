lazy val db = (project in file("."))
  .settings(
    Settings.default,
    libraryDependencies += Libraries.cassandra,
    excludeDependencies ++= Seq(
      ExclusionRule("org.slf4j", "slf4j-log4j12")
    ),
    mainClass in (run / assembly) := Some("edu.cdl.iot.db.fixtures.Main"),
    assemblyJarName in assembly := "db.jar",
    assemblyMergeStrategy in assembly := {
      case PathList("META-INF", "io.netty.versions.properties", xs@_*) => MergeStrategy.last
      case x =>
        val oldStrategy = (assemblyMergeStrategy in assembly).value
        oldStrategy(x)
    }
  ).dependsOn(Shared.protocol, Shared.common, Shared.dao)