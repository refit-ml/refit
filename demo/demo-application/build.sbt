lazy val `demo-cassandra` = project in file("../demo-cassandra")
lazy val `demo-core` = project in file("../demo-core")

name := "demo-application"
Settings.default
baseAssemblySettings
libraryDependencies ++= Dependencies.camel
assemblyJarName in assembly := "demo.jar"
mainClass in (run / assembly) := Some("edu.cdl.iot.demo.application.CamelMain")
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
  `demo-core`,
  `demo-cassandra`,
  Shared.protocol
)
