lazy val cassandra = project in file("../ingestion-cassandra")
lazy val core = project in file("../ingestion-core")

name := "ingestion-application"
Settings.default
baseAssemblySettings
libraryDependencies ++= Dependencies.camel
assemblyJarName in assembly := "ingestion_h.jar"
mainClass in (run / assembly) := Some("edu.cdl.iot.ingestion.application.CamelMain")
assemblyMergeStrategy in assembly := {
  case PathList("META-INF", "io.netty.versions.properties", xs@_*) => MergeStrategy.last
  case PathList("META-INF", "jandex.idx", xs@_*) => MergeStrategy.last
  case "component.properties" => MergeStrategy.last
  case "language.properties" => MergeStrategy.last
  case "module-info.class" => MergeStrategy.last
  case "MANIFEST.MF" => MergeStrategy.last
  case PathList("javax", "activation", xs@_*) => MergeStrategy.last
  case PathList("org", "slf4j", "impl", xs@_*) => MergeStrategy.first
  case x =>
    val oldStrategy = (assemblyMergeStrategy in assembly).value
    oldStrategy(x)
}

dependsOn(
  core,
  cassandra
)
