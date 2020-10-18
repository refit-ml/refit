lazy val ingestion = (project in file("."))
  .settings(
    Settings.default,
    baseAssemblySettings,
    libraryDependencies ++= Dependencies.ingestion,
    libraryDependencies += "ch.qos.logback" % "logback-classic" % "1.2.3",
    assemblyJarName in assembly := "ingestion.jar",
    mainClass in (run / assembly) := Some("edu.cdl.iot.ingestion.CamelMain"),
    assemblyMergeStrategy in assembly := {
      case PathList("META-INF", "io.netty.versions.properties", xs@_*) => MergeStrategy.last
      case PathList("META-INF", "jandex.idx", xs@_*) => MergeStrategy.last
      case "component.properties" => MergeStrategy.last
      case "language.properties" => MergeStrategy.last
      case "module-info.class" => MergeStrategy.last
      case "MANIFEST.MF" => MergeStrategy.last
      case PathList("javax", "activation", xs@_*) => MergeStrategy.last
      case x =>
        val oldStrategy = (assemblyMergeStrategy in assembly).value
        oldStrategy(x)
    }
  ).dependsOn(Shared.protocol, Shared.common, Shared.dao)